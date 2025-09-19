class_name EnemyWave
extends Resource

@export var spawn_groups: Array[EnemySpawnGroup]



func spawn():
	for group in spawn_groups:
		group.spawn()
