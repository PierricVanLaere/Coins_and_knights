extends Area2D

@onready var timer = $Timer
var config = ConfigFile.new()
var color = "default"
func _on_body_entered(body: Node2D) -> void:
	if self.get_parent().name.begins_with("Slime"):
		if body.get_node('AnimatedSprite2D').animation !="roll_"+color:
			death(body)
	else:
		death(body)

func _ready():
	load_config()

func load_config():
	var err = config.load("user://config/settings.cfg")
	if err == OK:
		color = config.get_value("Knight", "color", null)

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	
func death(body):
	Engine.time_scale = 0.5
	body.is_alive=false
	body.get_node('AnimatedSprite2D').play("hit_default")
	body.get_node('CollisionShape2D').queue_free()
	timer.start()
