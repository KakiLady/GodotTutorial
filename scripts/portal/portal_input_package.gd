class_name PortalInputPackage extends Node

var detector_package: DetectorPackage

func free():
	detector_package.queue_free()
	super()
