class_name BaseEnemySpawnPattern
extends Resource



func spawn_group(ship_scene: PackedScene, center: Vector2, amount: int):
	assert(false, "Abstract function")
	pass


func spawn_ship(ship_scene: PackedScene, pos: Vector2):
	var ship: Ship= ship_scene.instantiate()
	ship.position= pos
	Global.level.add_child(ship)
