class_name MainThrusterComponent
extends BaseShipComponent

const THRUST_PER_TIER= 100



func tick(ship: Ship, delta: float):
	var thrust_input: float= ship.controller.thrust
	ship.apply_central_force(get_thrust() * thrust_input * ship.get_forward())


func get_thrust()-> float:
	return tier * THRUST_PER_TIER
