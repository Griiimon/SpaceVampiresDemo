class_name ControlThrustersComponent
extends BaseShipComponent

@export var torque_per_tier: float= 100.0



func update_state(ship: Ship, tier: int, delta: float)-> bool:
	return not is_zero_approx(ship.controller.rotate)


func tick(ship: Ship, tier: int, delta: float):
	var rotate_input: float= ship.controller.rotate
	ship.apply_torque(get_torque(tier) * ship.get_component_efficiency() * rotate_input)


func get_torque(tier: int)-> float:
	return tier * torque_per_tier
