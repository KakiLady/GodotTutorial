class_name PortalInput extends Node2D

@onready var detector: Detector = $"Detector"

func get_input() -> PortalInputPackage:
	var portal_input_package = PortalInputPackage.new()
	portal_input_package.detector_package = detector.get_detector_package()
	return portal_input_package
