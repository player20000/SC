extends Control

onready var config: = $config
onready var main: = $container

onready var close: = $container / close

onready var press: = $audio / press
onready var focus: = $audio / focus

func _ready():
	config.visible = false

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_cancel"):
			if get_parent().get_parent().get_tree().paused != true:
				get_parent().get_parent().get_tree().paused = true
			else :
				get_parent().get_parent().get_tree().paused = false

func _process(delta):
	if get_parent().get_parent().get_tree().paused == true:
		visible = true
	else :
		close.text = str("close the game")
		visible = false

func _on_return_button_down():
	get_parent().get_parent().get_tree().paused = false

func _on_close_button_down():
	if close.text == ("close the game, NOW?"):
		get_tree().quit()
	close.text = str("close the game, NOW?")

func _on_config_button_down():
	config.visible = true

func _on_fullscreen_button_down():
	OS.window_fullscreen = not OS.window_fullscreen

func _on_back_button_down():
	config.visible = false

func _on_button_down():
	press.play()

func _on_mouse_entered():
	focus.play()

func _on_lobby_button_down():
	get_parent().get_parent().get_tree().paused = false
	get_tree().change_scene("res://scenes/levels/menu/menu.tscn")
