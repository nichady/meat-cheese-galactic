extends Node


func _ready():
	randomize()


const World = preload("res://src/world/world.tscn")

const eyeglow_red = preload("res://src/entities/player/eyeglow_red.png")
const bolt_red = preload("res://src/entities/projectile/bolt/bolt_red.png")
