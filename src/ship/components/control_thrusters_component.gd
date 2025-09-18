class_name ControlThrustersComponent
extends BaseShipComponent

@export var torque_per_tier= 100


func tick(ship: Ship, tier: int, delta: float):
	var rotate_input: float= ship.controller.rotate
	ship.apply_torque(get_torque(tier) * rotate_input)


func get_torque(tier: int)-> float:
	return tier * torque_per_tier
