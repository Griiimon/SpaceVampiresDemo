class_name GeneratorComponent
extends BaseShipComponent

@export var production_per_tier: float= 100.0



func update_state(ship: Ship, tier: int, delta: float)-> bool:
	return true


func tick(ship: Ship, tier: int, delta: float):
	ship.add_energy(get_produced_energy(tier) * delta)
	

func get_produced_energy(tier: int)-> float:
	return production_per_tier * tier
