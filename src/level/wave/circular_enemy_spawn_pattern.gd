class_name CircularEnemySpawnPattern
extends BaseEnemySpawnPattern

@export var radius: int



func spawn_group(ship_scene: PackedScene, center: Vector2, amount: int):
	for i in amount:
		spawn_ship(ship_scene, center + Vector2.from_angle(i * 2 * PI / float(amount)) * radius)
