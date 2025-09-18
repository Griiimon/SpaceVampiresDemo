class_name ControlThrustersComponent
extends BaseShipComponent

const TORQUE_PER_TIER= 100


func tick(ship: Ship, delta: float):
	var rotate_input: float= ship.controller.rotate
	ship.apply_torque(get_torque() * rotate_input)


func get_torque()-> float:
	return tier * TORQUE_PER_TIER
