class_name BaseShipComponent
extends Resource

@export var energy_usage_per_tier: float= 10.0


func update_state(ship: Ship, tier: int, delta: float)-> bool:
	assert(false, "Abstract function")
	return false


func get_energy_usage(ship: Ship, active: bool, tier: int, delta: float)-> float:
	if active:
		return energy_usage_per_tier * tier * delta
	return 0.0


func tick(ship: Ship, tier: int, delta: float):
	pass


func on_activity_changed(ship: Ship, active: bool, tier: int):
	pass

func get_display_name()-> String:
	return resource_path.get_file().trim_suffix("_component.tres").to_pascal_case()
