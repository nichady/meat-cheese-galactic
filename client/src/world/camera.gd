extends Camera2D


func follow(entity):
	print(1)
	get_parent().remove_child(self)
	entity.add_child(self)
