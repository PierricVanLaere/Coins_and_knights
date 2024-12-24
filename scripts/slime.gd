extends Node2D

const SPEED = 45
var direction = 1
var is_alive = true
var color = "default"
var config = ConfigFile.new()
@onready var ray_cast_right = $RayCastRight 
@onready var timer = $Timer
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_alive:
		queue_free()
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta


func _on_head_body_entered(body: Node2D) -> void:
	if body.get_node('AnimatedSprite2D').animation !="roll_"+color:
		body.velocity.y = -200 
	else:
		body.velocity.x = -50 
	animated_sprite.play("death")
	timer.start()

func _ready():
	load_config()

func load_config():
	var err = config.load("user://config/settings.cfg")
	if err == OK:
		color = config.get_value("Knight", "color", null)

func _on_timer_timeout() -> void:
		self.is_alive=false
