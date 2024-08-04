class_name PortalIdleState extends PortalState


func transition(input: PortalInputPackage) -> String:
	if (
		len(input.detector_package.detected_areas) > 0 
		and has_teleportable_area(input.detector_package.detected_areas)
	):
			return "PortalTransportingState"
	return name

func process(input: PortalInputPackage, delta: float):
	pass

func enter_state():
	super()

func exit_state():
	pass


func has_teleportable_area(detected_areas: Array[Area2D]) -> bool:
	for area in detected_areas:
		if area.has_method("can_teleport") and area.can_teleport():
			return true
	return false
