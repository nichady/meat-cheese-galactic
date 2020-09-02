using Godot;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using Environment = System.Environment;
using Thread = System.Threading.Thread;

public sealed class CSUtility : Node
{
	private HashSet<Thread> searchThreads = new HashSet<Thread>(); // TODO Dont know if needed, check if threads automatically die

	public void SearchForServers(int halfRange, int halfMaxThreads, int timeoutMillis)
	{
		string[] nets = Dns.GetHostEntry(Dns.GetHostName()).AddressList.Last().ToString().Split('.');
		(string, int) sub = (nets[0] + "." + nets[1] + ".", int.Parse(nets[2]));

		List<int> higher = new List<int>();
		List<int> lower = new List<int>();
		for (int i = 0; i < halfRange; i++)
		{
			int temp;
			if ((temp = sub.Item2 + i) < 256) higher.Add(temp);
			if ((temp = sub.Item2 - 1 - i) >= 0) lower.Add(temp);
		}

		int nextHigher = 0;
		int nextLower = 0;
		for (int i = 0; i < halfMaxThreads; i++)
		{
			Thread thread = new Thread(() => { while (nextHigher < higher.Count) SearchSubnetMask(sub.Item1 + higher[nextHigher++] + ".", timeoutMillis); });
			thread.Start();
			searchThreads.Add(thread);

			Thread thread2 = new Thread(() => { while (nextLower < lower.Count) SearchSubnetMask(sub.Item1 + lower[nextLower++] + ".", timeoutMillis); });
			thread2.Start();
			searchThreads.Add(thread2);
		}
	}

	private void SearchSubnetMask(string subnet, int timeoutMillis)
	{
		for (int i = 1; i <= 255; i++)
		{
			TcpClient client = new TcpClient();
			IAsyncResult result = client.BeginConnect(subnet + i, 40708, null, null);
			result.AsyncWaitHandle.WaitOne(timeoutMillis, true);
			if (client.Connected)
			{
				client.EndConnect(result);

				byte[] msg = new byte[1024];
				client.GetStream().ReadTimeout = 1000;
				client.GetStream().Read(msg, 0, msg.Length);
				string[] info = Encoding.ASCII.GetString(msg).Split(':');
				if (!info[0].Equals("godot-server-redirect")) continue;
				GetNode("/root/Events").EmitSignal("server_found", info[1], int.Parse(info[2]), info[3]);
			}
			else client.Close();
		}
	}

	public string SystemName => Environment.UserName;
}
