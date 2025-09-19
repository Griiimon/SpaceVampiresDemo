class_name AIShipController
extends ShipController



func _physics_process(delta: float) -> void:
	var attack_dir:= ship.position.direction_to(Global.player_ship.position)
	rotate= ship.global_transform.y.dot(attack_dir)

	if abs(ship.global_transform.x.angle_to(attack_dir)) > PI / 2:
		rotate= 1

	if pow(randf(), 8) > abs(rotate):
		rotate= 0
