class_name InertialDampenersComponent
extends BaseShipComponent

@export var damping_per_tier: float= 0.1


func update_state(ship: Ship, tier: int, delta: float)-> bool:
	return ship.controller.brake > 0


func on_activity_changed(ship: Ship, active: bool, tier: int):
	if active:
		ship.linear_damp= get_damping(tier) * ship.get_component_efficiency()
	else:
		ship.linear_damp= 0


func get_damping(tier: int)-> float:
	return tier * damping_per_tier
