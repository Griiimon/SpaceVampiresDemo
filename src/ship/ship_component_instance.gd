class_name ShipComponentInstance
extends Resource

@export var type: BaseShipComponent
@export var tier: int= 1

var active: bool= false
var last_energy_percentage: float


func update_state(ship: Ship, delta: float):
	active= type.update_state(ship, tier, delta)


func get_energy_usage(ship: Ship, delta: float)-> float:
	return type.get_energy_usage(ship, active, tier, delta)


func tick(ship: Ship, delta: float):
	type.tick(ship, tier, delta)


func on_activity_changed(ship: Ship, active: bool, tier: int):
	type.on_activity_changed(ship, active, tier)


func upgrade(n: int= 1):
	tier+= 1
