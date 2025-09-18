class_name PlayerShipController
extends ShipController


func _physics_process(delta: float) -> void:
	thrust= clampf(Input.get_axis("down", "up"), 0.0, 1.0)
	rotate= Input.get_axis("left", "right")
	
	# if GameSettings.mouse_control:
	# 	rotate= ship.global_transform.y.dot(ship.get_global_mouse_position())
