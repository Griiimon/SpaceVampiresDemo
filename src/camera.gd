extends Camera2D

@export var player: PlayerShip


func _process(delta: float) -> void:
	if not player: 
		return

	position= player.position
	zoom= Vector2.ONE / (sqrt(player.linear_velocity.length()) * 0.1 + 1)
