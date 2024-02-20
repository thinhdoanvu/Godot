extends Node2D

onready var gio = OS.get_datetime().hour
onready var phut = OS.get_datetime().minute
onready var _min = $min
onready var _hor = $hor
const RAD = 360/PI

var d = 0
var fullday = true
var is_finish = false
var dem = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not fullday:
		d = delta 
		_min.rotation_degrees = _min.rotation_degrees + d/0.1 * RAD
		if _min.rotation_degrees>360:
			_min.rotation_degrees = 0
			dem+=1
			_hor.rotation_degrees = _hor.rotation_degrees + 12
			#print(dem)
		if dem > 5*12:
			fullday = true
			is_finish = true
	else:
		_min.rotation_degrees = OS.get_datetime().minute*6
		_hor.rotation_degrees = OS.get_datetime().hour*30 + _min.rotation_degrees/12
	pass


func _on_Button_button_up():
	dem=0
	fullday = not fullday
