class_name Level
extends Node2D



func _ready() -> void:
	Global.level= self


func spawn_wave(wave: EnemyWave):
	wave.spawn()
