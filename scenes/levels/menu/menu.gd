extends Spatial

onready var camera: = $camera
onready var camposition: = $camposition
onready var player: = $player

func die():
	player.die()

func _physics_process(delta):
	camera.look_at(player.translation / 2, Vector3.UP)
	camposition.translation.x = player.translation.x / 2
	camposition.translation.y = player.translation.y + 5

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_fullscreen"):
			OS.window_fullscreen = not OS.window_fullscreen
