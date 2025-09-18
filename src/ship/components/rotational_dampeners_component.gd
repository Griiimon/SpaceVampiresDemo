class_name RotationalDampenersComponent
extends BaseShipComponent

const torque_per_tier= 0.2



func tick(ship: Ship, tier: int, delta: float):
	var rotate_input: float= ship.controller.rotate
	if is_zero_approx(rotate_input):
		ship.angular_damp= get_damping(tier)
	else:
		ship.angular_damp= 0


func get_damping(tier: int)-> float:
	return tier * torque_per_tier
