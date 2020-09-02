extends Node


signal user_joined(id, username, system_name)
signal user_left(id)
signal user_team_changed(id, new_team)

signal chat_messaged(message)

signal game_state_changed(state)
