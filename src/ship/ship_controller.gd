class_name ShipController
extends Node

@onready var ship: Ship= get_parent()

var thrust: float
var rotate: float
var brake: float


func _ready() -> void:
	assert(ship)
