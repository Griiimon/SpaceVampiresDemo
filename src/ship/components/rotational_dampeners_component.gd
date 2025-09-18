class_name RotationalDampenersComponent
extends BaseShipComponent

const torque_per_tier= 0.2


func update_state(ship: Ship, tier: int, delta: float)-> bool:
	return is_zero_approx(ship.controller.rotate)


func on_activity_changed(ship: Ship, active: bool, tier: int):
	if active:
		ship.angular_damp= get_damping(tier) * ship.get_component_efficiency()
	else:
		ship.angular_damp= 0


func get_damping(tier: int)-> float:
	return tier * torque_per_tier
