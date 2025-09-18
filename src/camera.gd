extends Camera2D

@export var player: PlayerShip


func _process(delta: float) -> void:
	if not player: 
		return

	position= player.position
