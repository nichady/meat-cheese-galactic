extends Node


enum Team {
	BLUE,
	RED,
	NONE,
}

const users = { }

var user_count setget , get_user_count
var blue_count setget , get_blue_count
var red_count setget , get_red_count
var none_count setget , get_none_count


func add_user(id, username, system_name):
	users[id] = {
		"username": username,
		"system_name": system_name,
		"team": Team.BLUE,
	}
	Events.emit_signal("user_joined", id, username, system_name)


func remove_user(id):
	users.erase(id)
	Events.emit_signal("user_left", id)


func get_blues(): # TODO use this for Users tab
	var blues = []
	for user in users.values():
		if user.team == Team.BLUE:
			blues.append(user)
	return blues
# TODO dont know if needed

func get_reds():
	var reds = []
	for user in users.values():
		if user.team == Team.RED:
			reds.append(user)
	return reds


#func get_nones():
#	pass


func get_user_count():
	return users.size()


func get_blue_count():
	var count = 0
	for user in users.values():
		if user.team == Team.BLUE: # TODO .team
			count += 1
	return count


func get_red_count():
	var count = 0
	for user in users.values():
		if user.team == Team.RED:
			count += 1
	return count


func get_none_count():
	var count = 0
	for user in users.values():
		if user.team == Team.NONE:
			count += 1
	return count


func change_team(id, new_team):
	users[id].team = new_team
	Events.emit_signal("user_team_changed", id, new_team)


func kick(id):
	id = int(id)
	get_tree().network_peer.disconnect_peer(id)
