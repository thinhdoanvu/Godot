extends Sprite

export (bool) var already_draw_v1 = false
export (bool) var end_draw_v1 = false
export (bool) var already_draw_v2 = false
export (bool) var end_draw_v2 = false
export (bool) var already_draw_v3 = false
export (bool) var end_draw_v3 = false

onready var quecay = get_parent().get_node("quecay")
onready var vikhuan = get_parent().get_node("quecay/vikhuan")
onready var canhbao_frame = get_parent().get_node("error")
onready var canhbao_error = get_parent().get_node("lbl_error")
onready var canhbao_button = get_parent().get_node("but_error")
onready var hengio_button = get_parent().get_node("but_hengio")
onready var diavk = get_parent().get_node("diavk")
onready var bunsen = get_parent().get_node("bunsen")
onready var animate_perti = get_parent().get_node("nap_petri/animate")
onready var finish_button = get_parent().get_node("but_finish")

#Dat moi vung mọt bien vi co kha nang giua cac vung chong lan gia tri cac bien voi nhau
#Ví du: enter: gia tri la true va exited la false nhung: exit v1 == area v2 
var error_khukhuan_v1 = false
var error_khukhuan_v2 = false
var error_khukhuan_v3 = false
var error_khuanlac_v1 = false
var error_khuanlac_v2 = false
var error_khuanlac_v3 = false
var error_v1_first_v2 = false
var error_v1_first_v3 = false
var error_v2_first_v3 = false
var error_v1_l2 = false
var error_v2_l2 = false
var error_v3_l2 = false

var check_v2_l2 = false
var check_v3_l2 = false

var is_finish = false
var is_fadeout = false

onready var velan_x_v1 = 0
onready var velan_x_v2 = 0
onready var velan_x_v3 = 0

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#READY
func _ready():
	pass # Replace with function body.
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	#Canh bao chua lay khua lac o lan dau tien
	#print(error_khuanlac_v1)
	if quecay.isclick && (error_khuanlac_v1 || error_khuanlac_v2 || error_khuanlac_v3):
		#print("TET")
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn chưa lấy khuẩn lạc"
		hide_quecay()
	#Canh bao chua khu khuan
	if quecay.isclick && (error_khukhuan_v1 || error_khukhuan_v2 || error_khukhuan_v3):
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Que cấy chưa được khử khuẩn"
		hide_quecay()
	#Canh bao ve vung 1 truoc, cho vung 2
	if quecay.isclick && (error_v1_first_v2):
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn cần cấy lên vùng 1 trước"
		hide_quecay()
	#Canh bao ve vung 1 truoc, cho vung 3
	if quecay.isclick && (error_v1_first_v3):
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn cần cấy lên vùng 1 trước"
		hide_quecay()
	#Canh bao ve vung 2 truoc
	if quecay.isclick && error_v2_first_v3:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn cần cấy lên vùng 2 trước"
		hide_quecay()
	#Canh bao ve vung 1 lan thu 3
	if quecay.isclick && error_v1_l2:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn không được cấy vùng 1 lần thư 3"
		hide_quecay()
	#canh bao cay vung 2 2 lan ma chua chay vung 3
	if not quecay.isclick && velan_x_v2 == 2 && !end_draw_v3:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn đã thực hiện cấy 2 lần lên vùng 2 nhưng chưa cấy vùng 3. Vui lòng thực hiện lại toàn bộ thao tác"
		hide_quecay()
		canhbao_button.reload = true
		
	#Canh bao ve vung 2 lan thu 3
	if quecay.isclick && error_v2_l2:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn không được cấy vùng 2 lần thư 3"
		hide_quecay()
	#Canh bao ve vung 3 lan thu 2
	if quecay.isclick && error_v3_l2:
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn chưa thực hiện cấy vùng 3, vui lòng thực hiện lại bài thực hành"
		hide_quecay()
		
	#Hoan tat bai thuc hanh, sau khi hoan tat 3 vung
	if (not quecay.isclick && end_draw_v3 && velan_x_v3 == 2):
		canhbao_frame.visible = true
		canhbao_error.visible = true
		canhbao_button.visible = true
		canhbao_error.text = "Bạn đã hoàn thành việc cấy ria, chuyển sang giai đoạn ủ mẫu ..."
		#an cac doi tuong tru cai dia moi truong
		hide_quecay()
		quecay.visible = false
		#tat den bunsen
		get_parent().get_node("bunsen/fire").visible = false
		if not finish_button.disabled:
			finish_button.visible = true
		
	#Khi nhan nut hen gio
	if is_finish:
		#hide all
		canhbao_frame.visible = false
		canhbao_error.visible = false
		canhbao_button.visible = false
		canhbao_error.text = ""
		
	if is_fadeout:#dich chuyen que cay, dia vk va den kho xuong duoi
		get_parent().get_node("fadeout").play("fadeout")
		animate_perti.play("run")
		is_fadeout = false
		
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#HIDE QUE CAY
func hide_quecay():
	quecay.visible = true
	quecay.isclick = false
	quecay.ismove = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VUNG CAY 1
func _on_ar_diamt_v1_area_entered(area):
	if area.name == "ar_dauque":
		if !quecay.iskhukhuan && !vikhuan.visible:#Canh bao khu khuan
			error_khukhuan_v1 = true
		#Loi khu khu khuan nhung chua lay khuan lac
		elif quecay.iskhukhuan && !vikhuan.visible:#Canh bao chua lay khua lac
			error_khuanlac_v1 = true
		#Sau khi hoan tat ve lan 1, tiep tuc ve them lan nua ma vi khuan van con
		elif end_draw_v1 && vikhuan.scale.x >0.1:
			error_khukhuan_v1 = true
		#ve xong vung 1 lan 2 ma con tiep tuc muon ve lan 3
		elif velan_x_v1 > 1:
			error_v1_l2 = true
		
func _on_ar_diamt_v1_area_exited(area):
	error_khukhuan_v1 = false
	error_khuanlac_v1 = false
	error_v1_l2 = false
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VUNG CAY 2
func _on_ar_diamt_v2_area_entered(area):
	if area.name == "ar_dauque" && !quecay.iskhukhuan && !vikhuan.visible:#Canh bao khu khuan
		error_khukhuan_v2 = true
	#Loi khu khu khuan nhung chua lay khuan lac
	elif quecay.iskhukhuan && !vikhuan.visible:#Canh bao chua lay khua lac
		error_khuanlac_v2 = true
	#Canh bao ve len vung 1 truoc
	elif vikhuan.visible && !already_draw_v1 && vikhuan.scale.x >0.1:
		error_v1_first_v2 = true
	#Sau khi ve xong vung 1 ma chua duoc khu khuan (vk chua duoc lam teo lai)
	elif end_draw_v1 && vikhuan.scale.x >0.1:
		error_khukhuan_v2 = true
	#ve len vung v2 ma chua ve len v1 truoc
	elif vikhuan.scale.x <0.1  && !already_draw_v2:
		error_v1_first_v2 = true
	#Ve xong vung 2 lan 1 va chua khu khuan
	elif end_draw_v2 && !quecay.l2_khukhuan:
		error_khukhuan_v2 = true
	#Kiem tra diem ve lan 2 co trung voi diem nao do truoc day chua
	elif velan_x_v2 ==1 && quecay.l2_khukhuan:
		check_v2_l2 = true
	#Kiem tra ve len vung 2 lan thu 3
	elif velan_x_v2 ==2 && quecay.l2_khukhuan:
		error_v2_l2 = true
	#Sau khi hoan tat 3 vung
	elif end_draw_v3 && velan_x_v3 == 2:
		is_finish = true
		hengio_button.disabled = false
		
func _on_ar_diamt_v2_area_exited(area):
	error_khukhuan_v2 = false
	error_khuanlac_v2 = false
	error_v1_first_v2 = false
	error_v2_l2 = false
	check_v2_l2 = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VUNG CAY 3
func _on_ar_diamt_v3_area_entered(area):
	if area.name == "ar_dauque": 
		if !quecay.iskhukhuan && !vikhuan.visible:#Canh bao khu khuan
			error_khukhuan_v3 = true
			#Loi khu khu khuan nhung chua lay khuan lac
		elif quecay.iskhukhuan && !vikhuan.visible:#Canh bao chua lay khua lac
			error_khuanlac_v3 = true
		#Canh bao ve len vung 1 truoc
		elif vikhuan.visible && !already_draw_v1 && vikhuan.scale.x >0.1:
			error_v1_first_v3 = true
		#Sau khi ve xong vung 1 ma chua duoc khu khuan (vk chua duoc lam teo lai)
		elif end_draw_v1 && vikhuan.scale.x >0.1:
			error_khukhuan_v3 = true
		#Ve xong vung 1 nhung chua ve len vung 2 truoc
		elif end_draw_v1 && !already_draw_v2 && vikhuan.scale.x <0.1:
			error_v1_first_v3 = true
		#Sau khi ve xong vung 2 lan 1 ma chua duoc khu khuan ($quecay.l3_khukhuan = false)
		elif end_draw_v2 && !quecay.l3_khukhuan:
			error_khukhuan_v3 = true
		#Ve xong lan 1 vung 2, da khu khuan nhung chua duoc ve len vung 2 lan 2
		elif already_draw_v2 && vikhuan.scale.x <0.1 && !already_draw_v3:
			error_v2_first_v3 = true
		#Ve xong vung 1,2 2 lan ma chua ve vung 3
		elif !already_draw_v3 && velan_x_v2 == 2:
			error_v3_l2 = true
		#Sau khi ve xong vung 2 lan 2 ma chua duoc khu khuan ($diamt.velan_x_v3 = 1)
		#?
		#elif end_draw_v2 && already_draw_v3 && velan_x_v3 == 1:
		#	error_khukhuan_v3 = true
		#Sau khi hoan tat 3 vung
		elif end_draw_v3 && velan_x_v3 == 2:
			is_finish = true
			finish_button.disabled = false
	else:
		pass
		
func _on_ar_diamt_v3_area_exited(area):
	error_khukhuan_v3 = false
	error_khuanlac_v3 = false
	error_v1_first_v3 = false
	error_v2_first_v3 = false
	error_v3_l2 = false
