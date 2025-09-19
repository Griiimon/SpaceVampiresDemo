class_name PlayerShipController
extends ShipController



func _physics_process(delta: float) -> void:
	var up_down_input: float= Input.get_axis("down", "up")
	thrust= clampf(up_down_input, 0.0, 1.0)
	brake= clampf(-up_down_input, 0.0, 1.0)
	rotate= Input.get_axis("left", "right")
	primary_action= Input.is_action_just_pressed("primary_action")
	
	# if GameSettings.mouse_control:
	# 	rotate= ship.global_transform.y.dot(ship.get_global_mouse_position())
