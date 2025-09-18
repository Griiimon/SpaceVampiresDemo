class_name Ship
extends RigidBody2D

@export var controller: ShipController

@onready var components_node: Node = $Components

var components: Array[BaseShipComponent]


func _ready() -> void:
	for child in components_node.get_children():
		components.append(child)
	

func _physics_process(delta: float) -> void:
	for component in components:
		component.tick(self, delta)


func get_forward()-> Vector2:
	return global_transform.x
