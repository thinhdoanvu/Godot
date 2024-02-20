extends Button

onready var quecay = get_parent().get_node("quecay")
onready var canhbao_frame = get_parent().get_node("error")
onready var canhbao_error = get_parent().get_node("lbl_error")
onready var canhbao_button = get_parent().get_node("but_error")

export (bool) var reload = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if reload:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn đã thực hiện cấy vùng 3 khi chưa cấy vùng 2, thực hiện lại toạn bộ quy trình"
	
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#SHOW QUE CAY
func show_quecay():
	quecay.visible = true
	quecay.isclick = false
	quecay.ismove = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _on_but_error_button_up():
	if !reload:
		canhbao_button.visible = false
		canhbao_frame.visible = false
		canhbao_error.visible = false
		
		show_quecay()
	else:
		get_tree().reload_current_scene()
	
	
