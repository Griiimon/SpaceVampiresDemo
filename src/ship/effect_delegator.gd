class_name EffectDelegator
extends Node

@export var main_thruster_effect: ThrusterEffect
@export var control_thruster_effect_left: ThrusterEffect
@export var control_thruster_effect_right: ThrusterEffect


func start_effect(effect: Ship.Effect):
	var mapped_effect: ShipEffect= get_effect_node(effect)
	if mapped_effect:
		mapped_effect.start()


func stop_effect(effect: Ship.Effect):
	var mapped_effect: ShipEffect= get_effect_node(effect)
	if mapped_effect:
		mapped_effect.stop()


func set_effect_strength(effect: Ship.Effect, value: float):
	var mapped_effect: ShipEffect= get_effect_node(effect)
	if mapped_effect:
		mapped_effect.set_strength(value)


func get_effect_node(effect: Ship.Effect)-> ShipEffect:
	match effect:
		Ship.Effect.MAIN_THRUSTER:
			return main_thruster_effect
		Ship.Effect.CONTROL_THRUSTER_LEFT:
			return control_thruster_effect_left
		Ship.Effect.CONTROL_THRUSTER_RIGHT:
			return control_thruster_effect_right
	return null
