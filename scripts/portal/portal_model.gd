class_name PortalModel extends Node2D

@onready var state_machine:PortalStateMachine = $"StateMachine"
@export var buddy: Portal

func _ready():
	state_machine.accept_model(self)

func process(input: PortalInputPackage, delta: float):
	state_machine.process(input, delta)
