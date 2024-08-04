extends Node

@onready var label = $"../CanvasLayer/Label"

var score = 0

func add_point():
	score += 1
	label.text = "Coins: " + str(score)
