extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$background/animate_fire.play("fire")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_but_start_mouse_entered():
	$sound.playing = true


func _on_but_start_button_up():
	$sound_click.playing = true
	get_tree().change_scene("res://sences/Login.tscn")
