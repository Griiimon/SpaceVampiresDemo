class_name RotationalDampenersComponent
extends BaseShipComponent

const DAMPING_PER_TIER= 0.2



func tick(ship: Ship, delta: float):
	var thrust_input: float= ship.controller.thrust
	if is_zero_approx(thrust_input):
		ship.angular_damp= get_damping()
	else:
		ship.angular_damp= 0


func get_damping()-> float:
	return tier * DAMPING_PER_TIER
