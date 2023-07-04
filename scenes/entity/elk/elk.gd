extends KinematicBody

var walk:int = 8
const gravity:int = - 4

const deceleration:int = 8
const maxsimum:int = 32

var velocity: = Vector3()
onready var sprite: = $sprite
onready var ray: = $ray

func _physics_process(delta):
	sprite.scale.x = walk / 8
	ray.scale.x = walk / 8
	if ray.is_colliding():
		walk *= - 1
		ray.translation *= - 1

	velocity.x += walk
	if not is_on_floor():velocity.y += gravity

	velocity.x = clamp(velocity.x, - maxsimum, maxsimum)
	velocity = move_and_slide(velocity, Vector3.UP)

func _on_horns_body_entered(body):
	if body.is_in_group("character"):
		get_parent().get_parent().die()
