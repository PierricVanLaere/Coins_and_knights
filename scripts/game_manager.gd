extends Node

@onready var coins_counter = $"../Player/coins_counter"
var score = 0

func add_point():
	score += 1
	coins_counter.text = str(score)
