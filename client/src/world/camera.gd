extends Camera2D

# TODO dont know what to do with this file
func follow(entity):
	get_parent().remove_child(self)
	entity.add_child(self)
