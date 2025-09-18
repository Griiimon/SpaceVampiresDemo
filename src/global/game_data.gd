extends Node

@export_dir var ship_components_directory

var ship_components: Array[BaseShipComponent]



func _ready() -> void:
	load_components()


func load_components():
	for res in ResourceLoader.list_directory(ship_components_directory):
		ship_components.append(load(ship_components_directory + "/" + res))
