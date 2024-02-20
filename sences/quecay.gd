extends Sprite

export (bool) var iskhukhuan = false
export (bool) var isclick = false
export (bool) var ismove = false
export (bool) var l2_khukhuan = false#khu khuan lan 2, giam sat viec cay len vung 2 lan thu 1
export (bool) var l3_khukhuan = false#khu khuan lan 2, giam sat viec cay len vung 3 lan thu 1

var selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	if ismove:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		followMouse()
		rotation_degrees = -50
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#FOLOW MOUSE
func followMouse():
#	position.x = get_global_mouse_position().x
#	position.y = get_global_mouse_position().y
	position.x = lerp(position.x, get_global_mouse_position().x, 0.3)#0.3 default
	position.y = lerp(position.y, get_global_mouse_position().y, 0.3)#0.3 default
	position.x = clamp(position.x, 0, get_viewport().get_visible_rect().size.x-30)
	position.y = clamp(position.y, 10, get_viewport().get_visible_rect().size.y)
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#INPUT EVENT
func _input(event: InputEvent):
	#vua nhan chuot trai vua giu
	if event is InputEventMouse:
		if event.is_pressed() && event.get_button_index() == 1 && selected:
		#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			isclick = true
			ismove = true
	#Khi buong chuot
		elif event is InputEventMouseButton:
			if !event.pressed && selected:
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				isclick = false
				ismove = true
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#QUE CAY
func _on_ar_quecay_mouse_entered():
	selected = true

func _on_ar_quecay_mouse_exited():
	selected = false

func _on_ar_dauque_mouse_entered():
	selected = true

func _on_ar_dauque_mouse_exited():
	selected = false

