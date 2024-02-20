extends Path2D

onready var nap_animate = get_parent().get_node("nap_animate")
onready var nap_open = get_parent().get_node("nap_open_animate")

var is_napopen = false
var is_transform = false
var speed = 5

func _ready():
	nap_animate.playing = true

#INPUT EVENT
func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed && is_napopen:
			#an ngon tay
			nap_animate.visible = false
			#an nap
			$PathFollow2D/nap.visible = false
			#hien thi open nap
			nap_open.visible = true
			#an nap
			visible = false
			nap_open.playing = true
			is_transform = true
func _process(delta):
	if is_transform:
		$PathFollow2D.offset(speed)
		#$path2d/path_petri.set_offset($path2d/path_petri.get_offset() + speed)# * delta)
		pass

func _on_ar_open_mouse_entered():
	is_napopen = true


func _on_ar_open_mouse_exited():
	is_napopen = true
