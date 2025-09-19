extends PanelContainer

@export var ship: Ship
@export var button_scene: PackedScene
@export var progress_bar_scene: PackedScene

@onready var container: GridContainer = %Container

var component_power_bar: Dictionary



func _ready() -> void:
	build()


func _physics_process(delta: float) -> void:
	for comp_inst in ship.components:
		if component_power_bar.has(comp_inst):
			var progress_panel: DebugComponentProgressBar= component_power_bar[comp_inst]
			progress_panel.set_ratio(comp_inst.last_energy_percentage)


func build():
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

	for component in GameData.ship_components:
		var button: Button= button_scene.instantiate()

		button.text= component.get_display_name()
		container.add_child(button)
		button.pressed.connect(on_button_pressed.bind(component))

		var label:= Label.new()
		var tier:= 0
		if ship.has_component(component):
			tier= ship.get_component_tier(component)
		
		label.text= "---" if tier == 0 else str("Tier: ", tier)
		container.add_child(label)
		
		var progress_bar: DebugComponentProgressBar= progress_bar_scene.instantiate()
		container.add_child(progress_bar)
		if ship.has_component(component):
			component_power_bar[ship.get_component(component)]= progress_bar


func on_button_pressed(component: BaseShipComponent):
	ship.upgrade_component(component)
	build()
