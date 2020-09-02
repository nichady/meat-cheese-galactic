using Godot;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using Thread = System.Threading.Thread;

/**
 * This is a C# utility class.
*/
public sealed class CSUtility : Node 
{
	public string IP { get; private set; }

	public override void _Ready()
	{
		IPAddress[] addList = Dns.GetHostEntry(Dns.GetHostName()).AddressList;
		IPAddress localAdd = addList.Last();
		IP = localAdd.ToString();
	}

	public void CreateRedirectServer()
	{
		new Thread(() =>
		{
			TcpListener server = new TcpListener(IPAddress.Parse(IP), 40708);
			server.Start();
			while (true)
			{
				TcpClient client = server.AcceptTcpClient();
				byte[] msg = Encoding.ASCII.GetBytes("godot-server-redirect:" + IP + ":50303:" + GetNode("/root/Lobby").Call("get_user_count"));
				client.GetStream().Write(msg, 0, msg.Length);
				client.Close();
			}
		}).Start();
	}
}
