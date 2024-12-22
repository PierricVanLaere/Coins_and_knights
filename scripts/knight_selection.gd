extends Control

@onready var game_manager = %GameManager

func _on_blue_pressed() -> void:
	game_manager.knight = "blue"




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
