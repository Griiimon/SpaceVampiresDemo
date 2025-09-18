class_name MainThrusterComponent
extends BaseShipComponent

@export var thrust_per_tier: float= 100



func tick(ship: Ship, tier: int, delta: float):
	var thrust_input: float= ship.controller.thrust
	if is_zero_approx(thrust_input):
		ship.stop_effect(Ship.Effect.MAIN_THRUSTER)
	else:
		ship.start_effect(Ship.Effect.MAIN_THRUSTER)
		ship.apply_central_force(get_thrust(tier) * thrust_input * ship.get_forward())


func get_thrust(tier: int)-> float:
	return tier * thrust_per_tier
