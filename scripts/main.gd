extends Node3D

@onready var main_canvas = $MainCanvas
@onready var back_menu = $BackMenu

func _ready():
	back_menu.visible = false

func _input(event):
	if event.is_action_pressed("escape"):
		%Player.is_back_menu_on = true
		main_canvas.visible = false
		back_menu.visible = true
		
		

func _on_restart_button_pressed():
	get_tree().reload_current_scene()



func _on_back_button_pressed():
	back_menu.visible = false
	main_canvas.visible = true
	%Player.is_back_menu_on = false


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
