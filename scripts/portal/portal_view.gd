class_name PortalView extends Node2D

var model: PortalModel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func accept_model(model: PortalModel):
	self.model = model
	
func _process(delta: float):
	var current_state = model.state_machine.current_state
	var new_animation = "PortalAnimations/" + current_state
	if animation_player.current_animation != new_animation:
		animation_player.play(new_animation)
