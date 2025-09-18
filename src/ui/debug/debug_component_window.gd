extends PanelContainer

@export var ship: Ship
@export var button_scene: PackedScene

@onready var vbox: VBoxContainer = $MarginContainer/VBoxContainer



func _ready() -> void:
	build()


func build():
	for child in vbox.get_children():
		vbox.remove_child(child)
		child.queue_free()

	for component in GameData.ship_components:
		var button: Button= button_scene.instantiate()
		var tier:= 0
		if ship.has_component(component):
			tier= ship.get_component_tier(component)

		button.text= "%s Tier %d" % [ component.get_display_name(), tier ]
		vbox.add_child(button)
		button.pressed.connect(on_button_pressed.bind(component))


func on_button_pressed(component: BaseShipComponent):
	ship.upgrade_component(component)
	build()
