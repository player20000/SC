extends Area

export  var scene:String
onready var transition: = $cavas / transition

func _on_portal(body):
	if body.is_in_group("character"):
		transition.play("teleportate")

func _on_transition_animation_finished(anim_name):
	if anim_name == "teleportate":
		get_tree().change_scene(scene)
