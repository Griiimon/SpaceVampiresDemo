class_name ShipComponentInstance
extends Resource

@export var type: BaseShipComponent
@export var tier: int= 1



func tick(ship: Ship, delta: float):
	type.tick(ship, tier, delta)
