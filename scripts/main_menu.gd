extends Control

func _on_selection_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/selection_levels.tscn")


func _on_options_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/knight_selection.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
