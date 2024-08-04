class_name Portal extends Node2D

@onready var input: PortalInput = $Input
@onready var model: PortalModel = $Model
@onready var view: PortalView = $View

@export var buddy: Portal


func _ready():
	view.accept_model(model)
	model.buddy = buddy


func _process(delta):
	var input_package = input.get_input()
	model.process(input_package, delta)
	input_package.free()
	# view updates automatically
