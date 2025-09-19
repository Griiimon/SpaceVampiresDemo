extends Node

@onready var level: Level= get_parent()



func _ready() -> void:
	await level.ready
	level.spawn_wave(load("res://level/wave/waves/test_wave.tres"))
