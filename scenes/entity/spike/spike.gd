extends Area

onready var animation: = $animation

func on_spike(body):
	if body.is_in_group("character"):
		animation.play("spike")
		get_parent().get_parent().die()

	if body.is_in_group("nps"):
		animation.play("spike")
		body.velocity.x *= 2
