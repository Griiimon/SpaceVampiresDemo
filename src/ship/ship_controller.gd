class_name ShipController
extends Node

@onready var ship: Ship= get_parent()

var thrust: float
var rotate: float
var brake: float
var primary_action: bool



func _ready() -> void:
	assert(ship)
