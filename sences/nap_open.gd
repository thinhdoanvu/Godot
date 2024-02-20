extends Sprite

onready var nap_animate = get_parent().get_node("nap_animate")
onready var nap_open = get_parent().get_node("nap_open")

var is_napopen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	nap_animate.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#INPUT EVENT
func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed && is_napopen:
			#an ngon tay
			nap_animate.visible = false
			#hien thi open nap
			nap_open.visible = true
			#an nap
			visible = false
			nap_open.playing = true

func _on_ar_open_mouse_entered():
	is_napopen = true

func _on_ar_open_mouse_exited():
	is_napopen = false
