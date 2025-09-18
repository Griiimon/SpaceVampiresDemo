class_name BaseShipComponent
extends Resource


func tick(ship: Ship, tier: int, delta: float):
	pass


func get_display_name()-> String:
	return resource_path.get_file().trim_suffix("_component.tres")
