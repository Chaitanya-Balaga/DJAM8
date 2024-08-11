extends Node3D

@export var metalscrap_scene : PackedScene
var rand_dir = [1,-1]


func _ready():
	spawn_loot()
	spawn_loot()
	spawn_loot()

func spawn_loot():
	var new_loot = metalscrap_scene.instantiate()
	new_loot.position = Vector3(rand_dir.pick_random()*randi_range(24,30),
								rand_dir.pick_random()*randi_range(0,10),
								rand_dir.pick_random()*randi_range(30,40))
	add_child(new_loot)
