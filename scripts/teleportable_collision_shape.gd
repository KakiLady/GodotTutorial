class_name TeleportableArea2D extends Area2D

@export var player: CharacterBody2D
@export var teleportation_timeout: float = 5.0

var _can_teleport: bool = true
var _timer: Timer

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.autostart =false
	_timer.one_shot = true
	_timer.timeout.connect(func(): _can_teleport = true)

func can_teleport() -> bool:
	return _can_teleport

func teleport_to(position: Vector2):
	print("should teleport")
	if can_teleport():
		player.global_position = position
		_timer.start(teleportation_timeout)
		_can_teleport = false
