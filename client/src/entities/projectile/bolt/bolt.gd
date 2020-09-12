extends Projectile


onready var sprite = $Sprite


func _ready(): # move some stuff to projecile.gd
	add_collision_exception_with(entities.get_node(options.source))
	if options.team == 1:
		sprite.texture = Globals.bolt_red
	linear_velocity = options.direction * speed
	rotation = options.direction.angle()
