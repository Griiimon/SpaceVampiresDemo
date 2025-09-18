extends Node2D

@export var num_stars: int= 1000
@export var rect:= Rect2i(-5000, -5000, 10000, 10000)


func _draw() -> void:
	for i in num_stars:
		var pos:= Vector2(randf_range(rect.position.x, rect.position.x + rect.size.x), randf_range(rect.position.y, rect.position.y + rect.size.y))

		draw_circle(pos, 2, Color.WHITE)
