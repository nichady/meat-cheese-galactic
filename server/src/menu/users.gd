extends Tabs
# TODO max team 5 per team

func _ready():
	Events.connect("user_joined", self, "_on_user_joined")
	Events.connect("user_left", self, "_on_user_left")
	Events.connect("user_team_changed", self, "_on_team_changed")


func _on_user_joined(id, username, system_name):
	load_users($OptionButton.selected)
	update_count()


func _on_user_left(id):
	load_users($OptionButton.selected)
	update_count()


func _on_team_changed(id, new_team):
	load_users($OptionButton.selected)
	update_count()


func _on_OptionButton_item_selected(id):
	load_users(id)


func _on_UserList_item_selected(index):
	load_info(index)


func load_users(index):
	var selected = $UserList.get_item_metadata($UserList.get_selected_items()[0]) if $UserList.is_anything_selected() else null
	$UserList.clear()
	
	match index:
		0:
			for id in Lobby.users:
				$UserList.add_item(Lobby.users[id].username)
				$UserList.set_item_metadata($UserList.get_item_count() - 1, id)
				if id == selected:
					$UserList.select($UserList.get_item_count() - 1)
		1:
			for id in Lobby.users:
				var user = Lobby.users[id]
				if user.team == Lobby.Team.BLUE:
					$UserList.add_item(user.username)
					$UserList.set_item_metadata($UserList.get_item_count() - 1, id)
					if id == selected:
						$UserList.select($UserList.get_item_count() - 1)
		2:
			for id in Lobby.users:
				var user = Lobby.users[id]
				if user.team == Lobby.Team.RED:
					$UserList.add_item(user.username)
					$UserList.set_item_metadata($UserList.get_item_count() - 1, id)
					if id == selected:
						$UserList.select($UserList.get_item_count() - 1)
		3:
			for id in Lobby.users:
				var user = Lobby.users[id]
				if user.team == Lobby.Team.NONE:
					$UserList.add_item(user.username)
					$UserList.set_item_metadata($UserList.get_item_count() - 1, id)
					if id == selected:
						$UserList.select($UserList.get_item_count() - 1)
	
	if $UserList.is_anything_selected():
		load_info($UserList.get_selected_items()[0])
	else:
		$TabContainer/Info/Keys.hide()
		$TabContainer/Info/Values.hide()
		for buttons in $Buttons.get_children():
			buttons.disabled = true


func load_info(index):
	var id = $UserList.get_item_metadata(index)
	var user = Lobby.users[id]
	
	$TabContainer/Info/Values/Username.text = user.username
	$TabContainer/Info/Values/ID.text = id
	$TabContainer/Info/Values/SystemName.text = user.system_name
	$TabContainer/Info/Values/Team.text = Lobby.Team.keys()[user.team]
	$TabContainer/Info/Values/Status.text = ""
	
	$TabContainer/Info/Keys.show()
	$TabContainer/Info/Values.show()
	for buttons in $Buttons.get_children():
		buttons.disabled = false


func update_count():
	$OptionButton.set_item_text(0, "All (%d)" % Lobby.user_count)
	$OptionButton.set_item_text(1, "Blue (%d)" % Lobby.blue_count)
	$OptionButton.set_item_text(2, "Red (%d)" % Lobby.red_count)
	$OptionButton.set_item_text(3, "No Team (%d)" % Lobby.none_count)


func _on_ChangeTeam_pressed():
	show_popup("ChangeTeam")


func _on_ChangeTeam_Blue_pressed():
	Lobby.change_team($TabContainer/Info/Values/ID.text, Lobby.Team.BLUE)
	hide_popup()


func _on_ChangeTeam_Red_pressed():
	Lobby.change_team($TabContainer/Info/Values/ID.text, Lobby.Team.RED)
	hide_popup()


func _on_ChangeTeam_None_pressed():
	Lobby.change_team($TabContainer/Info/Values/ID.text, Lobby.Team.NONE)
	hide_popup()


func _on_KickPlayer_pressed():
	$Popups/KickPlayer/Label.text = "Kick " + $TabContainer/Info/Values/Username.text + "?"
	show_popup("KickPlayer")


func _on_KickPlayer_Ok_pressed():
	Lobby.kick($TabContainer/Info/Values/ID.text)
	hide_popup()


func _on_KickPlayer_Cancel_pressed():
	hide_popup()


func show_popup(name):
	$Popups/Darkener.show()
	$Popups.get_node(name).popup()


func hide_popup():
	$Popups/ChangeTeam.hide()
	$Popups/KickPlayer.hide()
	$Popups/Darkener.hide()
