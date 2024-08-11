extends CanvasLayer



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_button_pressed():
	get_tree().queue_free()


func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings_menu.tscn")
