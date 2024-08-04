class_name PortalTransportingState extends PortalState

@export var transition_time = 1.0
@export var teleportation_time = 0.8
var _cached_areas: Array[Area2D]

func transition(input: PortalInputPackage) -> String:
	if has_passed(transition_time):
		return "PortalIdleState"
	return name

func process(input: PortalInputPackage, delta: float):
	if (
		len(_cached_areas) != len(input.detector_package.detected_areas) 
		or _cached_areas != input.detector_package.detected_areas
	):
		_cached_areas = input.detector_package.detected_areas
		mark_enter()
	if has_passed(teleportation_time):
		for area in input.detector_package.detected_areas:
			if (
				area.has_method("teleport_to") 
				and area.has_method("can_teleport") 
				and area.can_teleport()
				and model.buddy != null
			):
				area.teleport_to(model.buddy.global_position)
		input.detector_package.detected_areas.clear()


func enter_state():
	super()

func exit_state():
	pass
