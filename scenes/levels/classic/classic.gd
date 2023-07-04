extends Spatial

onready var camera: = $camera
onready var camposition: = $camposition
onready var player: = $player

onready var elk: = $nps / elk

onready var clock: = $labels / clock
var time:int = 30

func die():
	player.die()

func _process(delta):
	if time <= 0:
		elk.velocity = Vector3.ZERO
		clock.text = str("You win")
	else :
		clock.text = str(time)

func _physics_process(delta):
		camera.look_at(player.translation / 1.5, Vector3.UP)
		camposition.translation.x = elk.translation.x
		camposition.translation.y = elk.translation.y + 5

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_fullscreen"):
			OS.window_fullscreen = not OS.window_fullscreen

func _on_timer_timeout():
	time -= 1
