extends Control

var config = ConfigFile.new()

func _on_blue_pressed() -> void:
	print("bleu")
	print("Chemin user:// :", ProjectSettings.globalize_path("user://config/settings.cfg"))
	config.set_value("Knight", "color", "blue")
	config.save("user://config/settings.cfg")
	load_config()

func _on_default_pressed() -> void:
	config.set_value("Knight", "color", "red")
	config.save("user://config/settings.cfg")
	load_config()

func _on_back_pressed() -> void:
	print("retour")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _ready():
	load_config()

func load_config():
	var err = config.load("user://config/settings.cfg")
	if err == OK:
		print("yes")
	else:
		print("Fichier de configuration introuvable. Création par défaut...")
	
