class_name MainThrusterComponent
extends BaseShipComponent

@export var thrust_per_tier: float= 100



func update_state(ship: Ship, tier: int, delta: float)-> bool:
	return ship.controller.thrust > 0


func tick(ship: Ship, tier: int, delta: float):
	var input: float= ship.controller.thrust
	ship.apply_central_force(get_thrust(tier) * ship.get_component_efficiency() * input * ship.get_forward())


func on_activity_changed(ship: Ship, active: bool, tier: int):
	if active:
		ship.start_effect(Ship.Effect.MAIN_THRUSTER)
	else:
		ship.stop_effect(Ship.Effect.MAIN_THRUSTER)


func get_thrust(tier: int)-> float:
	return tier * thrust_per_tier
