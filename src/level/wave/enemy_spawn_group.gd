class_name EnemySpawnGroup
extends Resource

@export var enemy_type: EnemyType
@export var amount: int= 1
@export var pattern: BaseEnemySpawnPattern



func spawn():
	pattern.spawn_group(enemy_type.ship_scene, Global.player_ship.position, amount)
