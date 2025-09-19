class_name ProjectileInstance
extends Node2D


var velocity: Vector2



func shoot(vel: Vector2):
	velocity= vel


func _physics_process(delta: float) -> void:
	position+= velocity


func on_body_entered(body: Node2D):
	queue_free()
