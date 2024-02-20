extends Node2D

var selected = false
var isclick = false
var isclose = false
var speed = 5
var run_animate =false
var hide = false

func _ready():
	$path2d/path_petri.offset = 0
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#INPUT EVENT
func _input(event: InputEvent):
	#vua nhan chuot trai vua giu
	if event is InputEventMouse:
		if event.is_pressed() && event.get_button_index() == 1 && selected:
		#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			isclick = true
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _physics_process(delta):
	if isclick:
		$path2d/path_petri.set_offset($path2d/path_petri.get_offset() + speed)# * delta)
	if isclose:
		$tuu/dongnap.visible = true
		$path2d/path_petri/petri.visible = false
	
	if $clock.is_finish:#Khi dong ho dung
		#NUT MO NAP
		$but_open.visible = true
		$error.visible = true
		$lbl_error.visible = true
		$lbl_error.text = "Quá trình ủ mẫu hoàn tất, clik nút Mở tủ để lấy mẫu ra khỏi tủ."
	if hide:
		visible = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#Dia PERTI
func _on_ar_petri_mouse_entered():
	selected = true
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#TU U
func _on_ar_monap_area_entered(area):
	#print(area.name)
	if area.name == "ar_petri":
		isclick = false
		isclose = true
		#Hien thi cua so thong bao
		$error.visible = true
		$lbl_error.visible = true
		$lbl_error.text = "Vui lòng click nút Tiếp theo để tiến hành ủ mẫu, thời gian ủ là 24 giờ."
		$but_start.visible = true
		
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#START
func _on_but_start_button_up():
	$sound.playing = true
	$but_start.visible = false
	$error.visible = false
	$lbl_error.visible = false
	$clock.fullday = false

#OPEN
func _on_but_open_button_up():
	$sound.playing = true
	hide = true
	$clock.is_finish = false
