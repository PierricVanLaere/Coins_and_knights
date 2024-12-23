extends Control

var config = ConfigFile.new()

func _on_blue_pressed() -> void:
	config.set_value("Knight", "color", "blue")
	config.save("user://config/settings.cfg")

func _on_default_pressed() -> void:
	config.set_value("Knight", "color", "default")
	config.save("user://config/settings.cfg")
	
func _on_red_pressed() -> void:
	config.set_value("Knight", "color", "red")
	config.save("user://config/settings.cfg")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _ready():
	load_config()

func load_config():
	config.load("user://config/settings.cfg")
