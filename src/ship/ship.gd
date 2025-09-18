class_name Ship
extends RigidBody2D

enum Effect { MAIN_THRUSTER, CONTROL_THRUSTER_LEFT, CONTROL_THRUSTER_RIGHT }

@export var controller: ShipController
@export var components: Array[ShipComponentInstance]
@export var effect_delegator: EffectDelegator



func _physics_process(delta: float) -> void:
	for component in components:
		component.tick(self, delta)


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
