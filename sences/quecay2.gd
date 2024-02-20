extends Sprite

export (bool) var iskhukhuan = false
export (bool) var isclick = false
export (bool) var ismove = false
export (bool) var l2_khukhuan = false#khu khuan lan 2, giam sat viec cay len vung 2 lan thu 1
export (bool) var l3_khukhuan = false#khu khuan lan 2, giam sat viec cay len vung 3 lan thu 1

var selected = false
var rota_90 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	if ismove:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		followMouse()
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#trong lo vi khuan => quay -90 + chi di chuyen len xuong
		if position.x >= 165 && position.x <=220:
			#han che vung di di chuyen ra ngoai
			position.y = clamp(position.y, 360, 580)
			if position.y >= 360 && position.y <= 600:
				rotation_degrees = -90
				position.x = clamp(position.x, 170, 200)
		else:
			rotation_degrees = -50
			position.x = clamp(position.x, 0, get_viewport().get_visible_rect().size.x-30)
			position.y = clamp(position.y, 10, get_viewport().get_visible_rect().size.y)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#FOLOW MOUSE
func followMouse():
	position.x = lerp(position.x, get_global_mouse_position().x, 0.3)#0.3 default
	position.y = lerp(position.y, get_global_mouse_position().y, 0.3)#0.3 defaultposition.x = lerp(position.x, get_global_mouse_position().x, 0.3)#0.3 default
	
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
#IQUE CAY
func _on_ar_quecay_mouse_entered():
	selected = true

func _on_ar_quecay_mouse_exited():
	selected = false

func _on_ar_dauque_mouse_entered():
	selected = true

func _on_ar_dauque_mouse_exited():
	selected = false

