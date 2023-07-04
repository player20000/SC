extends KinematicBody

var walk:int = 8
const impulse:int = 40
const gravity:int = - 4

const deceleration:int = 8
const maxsimum:int = 32

var canup:bool = false

var velocity: = Vector3()
onready var sprite: = $sprite
onready var animation: = $animation
onready var transition: = $cavas / transition

func _process(delta):
	translation.z = 0

func _physics_process(delta):
	if Input.get_axis("ui_left", "ui_right"):
		velocity.x += Input.get_axis("ui_left", "ui_right") * walk
		sprite.scale.x = Input.get_axis("ui_left", "ui_right")

	else :
		velocity.x -= velocity.x / deceleration

	if Input.is_action_pressed("ui_up") and canup == true:
		canup = false
		velocity.y = impulse
		animation.play("up")

	if Input.is_action_pressed("ui_slow"):
		velocity.x /= 2

	if not is_on_floor():velocity.y += gravity
	else :canup = true

	velocity.x = clamp(velocity.x, - maxsimum, maxsimum)
	velocity = move_and_slide(velocity, Vector3.UP)

func die():
	walk = 0
	velocity *= - 2
	transition.play("die")

func _on_transitio_finished(anim_name):
	if anim_name == "die":
		get_tree().reload_current_scene()
