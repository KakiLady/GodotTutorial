class_name Detector extends Area2D

var _detected_areas: Array[Area2D] = []
var _detected_bodies: Array[Node2D] = []

func get_detector_package() -> DetectorPackage:
	var detector_package = DetectorPackage.new()
	
	detector_package.detected_areas = _detected_areas
	detector_package.detected_bodies = _detected_bodies
	return detector_package


func _on_area_entered(area):
	_detected_areas.append(area)


func _on_area_exited(area):
	_detected_areas.erase(area)


func _on_body_entered(body):
	_detected_bodies.append(body)


func _on_body_exited(body):
	_detected_bodies.erase(body)
