class_name Ship
extends RigidBody2D

enum Effect { MAIN_THRUSTER, CONTROL_THRUSTER_LEFT, CONTROL_THRUSTER_RIGHT }

@export var controller: ShipController
@export var components: Array[ShipComponentInstance]
@export var effect_delegator: EffectDelegator



func _physics_process(delta: float) -> void:
	for component in components:
		component.tick(self, delta)


func add_component(component_type: BaseShipComponent):
	assert(false, "not implemented")


func upgrade_component(component_type: BaseShipComponent):
	if not has_component(component_type):
		add_component(component_type)
	get_component(component_type).upgrade()


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
