class_name PortalState extends Node

@export var model: PortalModel
var enter_timestamp: float

func transition(input: PortalInputPackage) -> String:
	return ""

func process(input: PortalInputPackage, delta: float):
	pass

func enter_state():
	mark_enter()

func exit_state():
	pass

func mark_enter():
	enter_timestamp = Time.get_unix_time_from_system()

func time_since_enter() -> float:
	return Time.get_unix_time_from_system() - enter_timestamp

func has_passed(duration: float) -> bool:
	return duration < time_since_enter()

