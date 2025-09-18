extends ThrusterEffect

@export var particles: CPUParticles2D


func start():
	particles.emitting= true


func stop():
	particles.emitting= false
