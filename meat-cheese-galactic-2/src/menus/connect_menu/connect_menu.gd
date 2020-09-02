extends Control


func _ready():
	Events.connect("server_joined", self, "_on_server_joined")


func _on_Username_text_changed(new_text):
	if new_text.empty():
		$Connect.disabled = true
		$Message.text = "Enter a username."
		return
	
	var regex = RegEx.new()
	regex.compile("\\W")
	if regex.search(new_text) != null:
		$Connect.disabled = true
		$Message.text = "Username can only contain letters, numbers, and underscores."
		return
	
	$Connect.disabled = false
	$Message.text = ""


func _on_Connect_pressed():
	$Connect.disabled = true
	$Message.text = "Searching for server..."
	$Username.editable = false
	CSUtility.SearchForServers(10, 8, 50)


func _on_server_joined():
	get_tree().change_scene_to(Globals.MainMenu)
