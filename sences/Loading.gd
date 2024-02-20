extends Control

var is_loading = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_loading:
		$ani_loading.play("run")


func _on_ani_loading_animation_finished(anim_name):
	is_loading = false
	visible = false
