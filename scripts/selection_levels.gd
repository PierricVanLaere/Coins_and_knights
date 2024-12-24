extends Control



func _on_1_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/Levels/Level I.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
