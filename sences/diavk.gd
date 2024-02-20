extends Sprite

onready var quecay = get_parent().get_node("quecay")
onready var vikhuan = get_parent().get_node("quecay/vikhuan")
onready var canhbao_frame = get_parent().get_node("error")
onready var canhbao_error = get_parent().get_node("lbl_error")
onready var canhbao_button = get_parent().get_node("but_error")
onready var diamt = get_parent().get_node("diamt")

var error_khukhuan = false
var error_khuanlac = false
var pick_khuanlac = false
var error_khuanlac_l2 = false
var error_khukhuan_l2 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#HIDE QUE CAY
func hide_quecay():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	quecay.visible = true
	quecay.isclick = false
	quecay.ismove = false
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	#Uu ten cai nay truoc
	#CHU Y THU TU CAC HAM IF TRANH TRUONG HOP CHONG LAN LEN NHAU
	if quecay.isclick && error_khukhuan_l2:#khu khuan lan 2 sau khi ve xong vung 1
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn không thể chọn khuẩn lạc lần 2"
		hide_quecay()
	if quecay.isclick && error_khuanlac_l2:#lay khuan la thanh cong lan thu 2
		vikhuan.visible = true
		quecay.iskhukhuan = false
		vikhuan.scale = Vector2(1.4,1.5)
		hide_quecay()
	#Canh bao chua khu khuan
	if quecay.isclick && error_khukhuan:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Que cấy chưa được khử khuẩn"
		hide_quecay()
	#Canh bao chon khuan lac o duong cay 3
	if quecay.isclick && error_khuanlac:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn cần chọn khuẩn lạc đơn"
		hide_quecay()
	if quecay.isclick && pick_khuanlac:#pick khuan lac thanh cong
		vikhuan.visible = true
		quecay.iskhukhuan = false
		#hide_quecay()
	#else:#NHA CHUOT MAT THONG BAO
	#	canhbao_frame.visible = false
	#	canhbao_error.visible = false
		#canhbao_button.visible = true
	#	canhbao_error.text = ""
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VUNG NGOAI BIEN
func _on_ar_ngoaibien_area_entered(area):
	#print(error_khukhuan_l2)
	if area.name == "ar_dauque" && diamt.already_draw_v1:#Canh bao khu khuan lan 2 sau khi cay vung 1
		error_khukhuan_l2 = true
		
	if area.name == "ar_dauque" && !quecay.iskhukhuan:#Canh bao khu khuan
		error_khukhuan = true
		
	if area.name == "ar_dauque" && quecay.iskhukhuan:#Canh bao chon khuan lac o duong 3
		error_khuanlac = true
		
func _on_ar_ngoaibien_area_exited(area):
	error_khukhuan = false
	error_khuanlac = false
	error_khuanlac_l2 = false
	error_khukhuan_l2 = false

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VUNG KHUAN LAC
func _on_ar_khuanlac1_area_entered(area):
	if area.name == "ar_dauque" && diamt.already_draw_v1:#Canh bao khu khuan lan 2 sau khi cay vung 1
		error_khukhuan_l2 = true
	if area.name == "ar_dauque" && !quecay.iskhukhuan:
		error_khukhuan = true
	if area.name == "ar_dauque" && quecay.iskhukhuan && !diamt.already_draw_v1:
		pick_khuanlac = true
	if area.name == "ar_dauque" && vikhuan.visible && vikhuan.scale.x <0.1 && !diamt.already_draw_v1:
		error_khuanlac_l2 = true
			
func _on_ar_khuanlac1_area_exited(area):
	error_khukhuan = false
	error_khuanlac = false
	error_khuanlac_l2 = false
	error_khukhuan_l2 = false
