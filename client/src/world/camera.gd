extends Camera2D


func follow(entity):
	get_parent().remove_child(self)
	entity.add_child(self)
