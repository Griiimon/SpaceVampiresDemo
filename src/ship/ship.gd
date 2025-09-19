class_name Ship
extends RigidBody2D

enum Effect { MAIN_THRUSTER, CONTROL_THRUSTER_LEFT, CONTROL_THRUSTER_RIGHT }

@export var controller: ShipController
@export var components: Array[ShipComponentInstance]
@export var effect_delegator: EffectDelegator

var total_available_energy: float
var available_energy_ratio: float



func _ready():
	for component in components:
		assert(not component.resource_path.is_empty(), "Use pre-generated component resources only!")


func _physics_process(delta: float) -> void:
	var consumed_energy: float= 0
	
	var state_change_list: Array[ShipComponentInstance]
	for component in components:
		var prev_state: bool= component.active
		component.update_state(self, delta)
		if prev_state != component.active:
			state_change_list.append(component)
		consumed_energy+= component.get_energy_usage(self, delta)

	for component in components:
		component.last_energy_percentage= component.get_energy_usage(self, delta) / total_available_energy

	available_energy_ratio= clampf(total_available_energy / consumed_energy, 0.0, 1.0)
	total_available_energy= 0
		
	
	for component in state_change_list:
		component.on_activity_changed(self, component.active, component.tier)


	for component in components:
		if component.active:
			component.tick(self, delta)



func add_component(component_type: BaseShipComponent):
	assert(not has_component(component_type))
	var comp_inst:= ShipComponentInstance.new()
	comp_inst.type= component_type
	components.append(comp_inst)


func upgrade_component(component_type: BaseShipComponent):
	if not has_component(component_type):
		add_component(component_type)
	else:
		get_component(component_type).upgrade()


func add_energy(energy: float):
	total_available_energy= energy


func get_component(component_type: BaseShipComponent)-> ShipComponentInstance:
	for comp_inst in components:
		if comp_inst.type == component_type:
			return comp_inst
	return null


func has_component(component_type: BaseShipComponent)-> bool:
	return get_component(component_type) != null


func get_component_tier(component_type: BaseShipComponent)-> int:
	assert(has_component(component_type))
	return get_component(component_type).tier


func get_component_efficiency()-> float:
	return available_energy_ratio


func get_forward()-> Vector2:
	return global_transform.x


func start_effect(effect: Effect):
	if not effect_delegator:
		return
	effect_delegator.start_effect(effect)


func stop_effect(effect: Effect):
	if not effect_delegator:
		return
	effect_delegator.stop_effect(effect)


func set_effect_strength(effect: Effect, value: float):
	if not effect_delegator:
		return
	effect_delegator.set_effect_strength(effect, value)
