extends Node

@onready var timer = $Timer
@onready var coins_counter = $"../Player/coins_counter"
var score = 0
var objectif = 10
var knight = "default"

func add_point():
	score += 1
	coins_counter.text = str(score)
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/selection_levels.tscn")
	
func _process(delta: float) -> void:
	if score == objectif:
		coins_counter.text = str("Gagné")
		score = 0
		Engine.time_scale = 0.5
		timer.start()
