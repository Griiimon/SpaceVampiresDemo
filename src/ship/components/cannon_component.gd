class_name CannonComponent
extends BaseShipComponent

@export var projectile: Projectile
@export var velocity_per_tier: float= 25.0


func update_state(ship: Ship, tier: int, delta: float)-> bool:
	return ship.controller.primary_action


func on_activity_changed(ship: Ship, active: bool, tier: int):
	if active:
		ship.shoot_projectile(projectile, velocity_per_tier * tier)
