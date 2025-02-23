extends Area2D


@onready var collision_shape = $CollisionShape2D
@onready var gpu_particles = $GPUParticles2D
var facing_direction = 3.14159

func _ready() -> void:
	var material = gpu_particles.process_material
	material.emission_box_extents = Vector3(collision_shape.shape.size.x/2 + 200,collision_shape.shape.size.y/2,0)
	gpu_particles.amount = (collision_shape.shape.size.x/collision_shape.shape.size.y) * 10
