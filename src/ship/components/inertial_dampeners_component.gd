class_name InertialDampenersComponent
extends BaseShipComponent

@export var damping_per_tier: float= 0.1


func tick(ship: Ship, tier: int, delta: float):
	var thrust_input: float= ship.controller.thrust
	if is_zero_approx(thrust_input):
		ship.linear_damp= get_damping(tier)
	else:
		ship.linear_damp= 0


func get_damping(tier: int)-> float:
	return tier * damping_per_tier
