extends Node2D

var hoten_mssv = " "
#onready var file = "res://sences/user.txt"

var kieuduong_v1 = false
var kieuduong_v2 = false
var kieuduong_v3 = false
var kieudiem = false
var kieuall = false

var checkpoint_v1: Array = []
var checkpoint_v2: Array = []
var checkpoint_v3: Array = []
var checkpoint: Array = []
#ham draw
var width = 2
var color = Color.silver
#Bien chay
var i
var j
var k
var l
var m
var ve_lan2_v1 = false
var ve_lan2_v2 = false
var ve_lan2_v3 = false

#DANH CHO NAP VI KHUAN
var is_opennap = false
var is_animate = false

#DANH CHO NAP MOI TRUONG
var is_opennap_mt = false
var is_animate_mt = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#READY
func _ready():
	#load_file(file)
	$lbl_hoten.text = "HỌ VÀ TÊN SV: " + Global.hoten
	
	$fadein.play("fadein")
	#thiet lap gia tri trong suot cho nap petri
	$nap_petri.self_modulate.a = 0.4
	$nap_petri.scale = Vector2(0,0)
	$nap_petri.position.x = 1000
	#Thiet lap toa do ve 
	$diamt.z_index = -1
	$background.z_index = -1
	$diamt/ar_diamt_v1.z_index = -1
	$diamt/ar_diamt_v2.z_index = -1
	$diamt/ar_diamt_v3.z_index = -1
	
	#Thiet lap do trong suot nap vikhuan
	$nap_vikhuan.self_modulate.a = 0.5
	#Thiet lap do trong suot nap moi truong
	$nap_mt.self_modulate.a = 0.5
	#Thiet lap animate cho nap
	yield(get_tree().create_timer(1),"timeout")
	$nap_animate.visible = true
	$nap_animate.playing = true
	#NGAN KHONG CHO MO NAP VI KHUAN TRUOC
	$nap_vikhuan/ar_napvk.visible = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#LOAD FILE
func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached():
		hoten_mssv = f.get_line()
		index += 1
	f.close()
	#Luu ho ten vao label hoten
	for i in len(hoten_mssv) - 9:
		$lbl_hoten.text += hoten_mssv[i]
	return

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#INPUT EVENT
func _input(event: InputEvent):
	#vua nhan chuot trai vua giu
	if event is InputEventMouse:#Kiem tra su kien nhan chuot chu khong phai nhan phim
		#Khi nhap len nap moi truong
		if event.is_pressed() && event.get_button_index() == 1 && is_opennap_mt:
			is_animate_mt = true
			#Chuyen animate sang nap vi khuan
			$nap_animate.position = Vector2(200,506)
		#Khi nhap len nap vi khuan
		if event.is_pressed() && event.get_button_index() == 1 && is_opennap:
			is_animate = true
			$nap_animate.visible = false#Tat ban tay click
			$quecay.visible = true#Xuat hien que cay
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	if $diamt.error_v2_first_v3 && !$diamt.end_draw_v2:
		$but_error.reload = true
	
	#DANH CHO NAP VI KHUAN
	if is_animate:
		$nap_vikhuan/animate_napvk.play("run")
		is_animate = false
	#DANH CHO NAP MOI TRUONG
	if is_animate_mt:
		$nap_mt/animate_napmt.play("run")
		is_animate_mt = false
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#RAW
func _draw():
	#diem ve diem ngau nhien
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	#ve dang diem
	if kieudiem:
		#for i in range(1,checkpoint.size(),rng.randi_range(1,10)):
		for i in checkpoint.size():
			draw_circle(Vector2(checkpoint[i]),width,color)
			
	#Ve dang duong
	if kieuduong_v1:
		for i in checkpoint_v1.size()-1:
			draw_line(Vector2(checkpoint_v1[i]), Vector2(checkpoint_v1[i + 1]),color,width)
	if kieuduong_v2:
		for i in checkpoint_v2.size()-1:
			draw_line(Vector2(checkpoint_v2[i]), Vector2(checkpoint_v2[i + 1]),color,width)
	if kieuduong_v3:
		for i in checkpoint_v3.size()-1:
			draw_line(Vector2(checkpoint_v3[i]), Vector2(checkpoint_v3[i + 1]),color,width)		
	#ve tong hop
	if kieuall:
		var i = 0
		var total = checkpoint.size()
		var sizev1 = checkpoint_v1.size()# - checkpoint_v2.size() - checkpoint_v3.size()
		var sizev2 = checkpoint_v2.size()
		var sizev3 = checkpoint_v3.size()
		print("Total: ",total, " v1: ",sizev1," v2: ",sizev2," v3: ",sizev3)
		width = 5
		color = Color("ccaf2d")
		#vung 1
		while i < sizev1-1:
			draw_line(Vector2(checkpoint[i]), Vector2(checkpoint[i + 1]),color,width)
			i+=1
		#vung 2
		m=i
		#color = Color.rebeccapurple
		while m < sizev1+sizev2-1:
			draw_line(Vector2(checkpoint[m]), Vector2(checkpoint[m + 1]),color,width)
			m+=1
		#vung3
		width = 3
		#color = Color.red
		for j in range(m+3,total - sizev3/3 *2,rng.randi_range(3,5)):
			draw_circle(Vector2(checkpoint[j]),width,color)
		width = 5
		for k in range(total - sizev3 + sizev3/3,total - sizev3 + sizev3/3*2,rng.randi_range(6,10)):
			draw_circle(Vector2(checkpoint[k]),width,color)
		width = 7
		for l in range(total - sizev3 + sizev3/3*2,total,rng.randi_range(10,13)):
			draw_circle(Vector2(checkpoint[l]),width,color)
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VE TREN VUNG 1
func _on_ar_diamt_v1_input_event(viewport, event, shape_idx):
	#print($quecay.update_v1,$quecay.update_v2,$quecay.update_v3)
	#print("v2: ",checkpoint_v2.size())
	#set trang thai vung 1 cua dia mt
	kieuduong_v1 = true#vung 1
	kieuduong_v2 = false#vung 2
	kieudiem = false#danh cho vung 3
	#Ve theo chuot
	#truong hop ve lan dau: vi khuan co kich thuoc that
	if $quecay.selected && $quecay/vikhuan.visible && $quecay/vikhuan.scale.x > 1:
		if not $quecay.isclick  || $diamt.error_khukhuan_v1:
			return
		else:
			$diamt.already_draw_v1 = true
			$diamt.end_draw_v1 = true
			checkpoint_v1.append(get_global_mouse_position())
			#checkpoint = checkpoint_v1
			update()
			$diamt.velan_x_v1 = 1
	#truong hop ve lan 2: vi khuan co kich thuoc thu nho
	if $quecay.selected && $quecay/vikhuan.scale.x < 0.1 && !ve_lan2_v1:
		if not $quecay.isclick || $diamt.error_khukhuan_v1:
			return
		else:
			$diemcuoi.position = $quecay.position
			#Do khoang cach giua diem cuoi voi cac diem da duoc ve truoc do
			for i in checkpoint_v1.size()-1:
				var check_v1x = checkpoint_v1[i].x
				var check_v1y = checkpoint_v1[i].y
				#Do khoang cach
				var dx = pow((check_v1x - $diemcuoi.position.x),2)
				var dy = pow((check_v1y - $diemcuoi.position.y),2)
				var d = sqrt(dx+dy)
				#print(d,"-",i,"+",checkpoint_v1.size()-1)
				if d<20:#Tim duoc diem ve
					ve_lan2_v1 = true
					#$diemcuoi.position = Vector2(0,0)
					break
			#Het for, meo co diem de ve
			return
			
	#truong hop ve lan 2: sau khi da ve len vung 1, lan nua
	if $quecay.selected && $quecay/vikhuan.scale.x < 0.1 && ve_lan2_v1:
		if not $quecay.isclick || $diamt.error_khukhuan_v1 || $diamt.error_v1_l2:
			return
		else:
			$diamt.already_draw_v1 = true
			$diamt.already_draw_v2 = true
			$diamt.end_draw_v1 = true
			checkpoint_v2.append(get_global_mouse_position())
			kieuduong_v2 = true#vung 2
			update()
			$diamt.velan_x_v1 = 2
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VE TREN VUNG 2
func _on_ar_diamt_v2_input_event(viewport, event, shape_idx):
	#print($quecay.update_v1,$quecay.update_v2,$quecay.update_v3)
	#print("v2: ",checkpoint_v2.size())
	#set trang thai vung 1 cua dia mt
	kieuduong_v1 = true#vung 1
	kieuduong_v2 = true#vung 2
	kieuduong_v3 = false#vung 3
	kieudiem = false#danh cho vung 3
	#Ve theo chuot
	#truong hop ve lan dau: sau khi ve xong vung 1 vaf que cay chua khu khuan lan 2
	if $quecay.selected && $diamt.already_draw_v2 && !$diamt.check_v2_l2 && !ve_lan2_v2:
		if not $quecay.isclick || $diamt.error_khukhuan_v2:
			return
		else:
			$diamt.already_draw_v1 = true
			$diamt.already_draw_v2 = true
			$diamt.already_draw_v3 = false
			$diamt.end_draw_v1 = true
			$diamt.end_draw_v2 = true
			checkpoint_v2.append(get_global_mouse_position())
			update()
			$quecay.l2_khukhuan = false
			$quecay.l3_khukhuan = false
			$diamt.velan_x_v2 = 1
	#truong hop ve lan 2: sau khi ve xong vung 2 lan dau
	if $quecay.selected && $diamt.check_v2_l2 && !ve_lan2_v2:
		if not $quecay.isclick || $diamt.error_khukhuan_v2:
			return
		else:
			$diemcuoi.position = $quecay.position
			#Do khoang cach giua diem cuoi voi cac diem da duoc ve truoc do
			for i in checkpoint_v2.size()-1:
				var check_v2x = checkpoint_v2[i].x
				var check_v2y = checkpoint_v2[i].y
				#Do khoang cach
				var dx = pow((check_v2x - $diemcuoi.position.x),2)
				var dy = pow((check_v2y - $diemcuoi.position.y),2)
				var d = sqrt(dx+dy)
				#print(d,"-",i,"+",checkpoint_v1.size()-1)
				if d<20:#Tim duoc diem ve
					ve_lan2_v2 = true
					#print(ve_lan2_v2)
					break
			#Het for, meo co diem de ve
			return
	#truong hop ve lan 2: sau khi da tim duoc diem ve chinh xac
	if $quecay.selected && ve_lan2_v2:
		if not $quecay.isclick || $diamt.error_khukhuan_v2 || $diamt.error_v2_l2:
			return
		else:
			kieuduong_v3 = true#vung 3
			$diamt.already_draw_v1 = true
			$diamt.already_draw_v2 = true
			$diamt.already_draw_v3 = true
			$diamt.end_draw_v1 = true
			$diamt.end_draw_v2 = true
			checkpoint_v3.append(get_global_mouse_position())
			update()
			$diamt.velan_x_v2 = 2
			$quecay.l2_khukhuan = false
			$quecay.l3_khukhuan = true
			$diamt.velan_x_v3 = 1
			
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#VE TREN VUNG 3
func _on_ar_diamt_v3_input_event(viewport, event, shape_idx):
	#print($quecay.update_v1,$quecay.update_v2,$quecay.update_v3)
	#print("v2: ",checkpoint_v2.size())
	#set trang thai vung 1 cua dia mt
	kieuduong_v1 = true#vung 1
	kieuduong_v2 = true#vung 2
	kieuduong_v3 = true#vung 3
	kieudiem = false#danh cho vung 3
	#Ve theo chuot
	#truong hop ve lan dau: sau khi ve xong vung 1 vaf que cay chua khu khuan lan 2
	if $quecay.selected && $diamt.already_draw_v3:
		if not $quecay.isclick ||$diamt.is_finish || $diamt.error_khukhuan_v3 || $diamt.error_khuanlac_v3 || $diamt.error_v1_first_v3 || $diamt.error_v2_first_v3 || $diamt.error_v3_l2:
			return
		else:
			kieuduong_v3 = true#vung 3
			$diamt.end_draw_v3 = true
			$diamt.already_draw_v1 = true
			$diamt.already_draw_v2 = true
			$diamt.already_draw_v3 = true
			$diamt.end_draw_v1 = true
			$diamt.end_draw_v2 = true
			checkpoint_v3.append(get_global_mouse_position())
			update()
			$quecay.l3_khukhuan = false
			$diamt.velan_x_v3 = 2
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#BUTTON HOME
func _on_but_homepage_button_up():
	$sound_click.playing = true
	get_tree().reload_current_scene()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://sences/Homepage.tscn")

#BUTTON REFRESH
func _on_but_refresh_button_up():
	$sound_click.playing = true
	get_tree().reload_current_scene()

#BUTTON FINISH
func _on_but_finish_button_up():
	$sound_click.playing = true
	#an nut fininh
	$but_finish.visible = false
	$but_finish.disabled = true
	$diamt.is_finish = true
	$diamt.is_fadeout = true
	#day napp vi khuan
	$nap_vikhuan.position = Vector2(190,494)
	#waiting ...
	yield(get_tree().create_timer(2),"timeout")
	$Loading.visible = true
	$Loading/ani_loading.play("run")
	
	
#BUTTON HENGIO
func _on_but_hengio_button_up():
	$sound_click.playing = true
	#LOAD SANG TRANG TU CAY
	$tucay.visible = true
	#Hien thi cac duong cay voi 1,2: duong, 3: diem
	veall()
	#thay the dia moi truong thanh dia ko co duong ke
	$diamt.texture = load("res://pics/diamt_finish.png")
	
#VE ALL
func veall():
	kieuduong_v1 = false
	kieuduong_v2 = false
	kieuduong_v3 = false
	kieuall = true
	checkpoint = checkpoint_v1 + checkpoint_v2 + checkpoint_v3
	update()
	#print(checkpoint.size())
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#DANH CHO NAP VI KHUAN
func _on_ar_napvk_mouse_entered():
	is_opennap = true

func _on_ar_napvk_mouse_exited():
	is_opennap = false
	
#DANH CHO NAP MOI TRUONG
func _on_ar_napmt_mouse_entered():
	is_opennap_mt = true

func _on_ar_napmt_mouse_exited():
	is_opennap_mt = false

#KHI KET THUC ANIMATE CUA MO NAP MOI TRUONG
func _on_animate_napmt_animation_finished(anim_name):
	$nap_vikhuan/ar_napvk.visible = true#Cho phep clik mo nap

#LOADING...
func _on_ani_loading_animation_finished(anim_name):
	$Loading.visible = false
	$Loading/ani_loading.stop()
	
	#LOAD SANG TRANG TU CAY
	$tucay.visible = true
	#Hien thi cac duong cay voi 1,2: duong, 3: diem
	veall()
	#thay the dia moi truong thanh dia ko co duong ke
	$diamt.texture = load("res://pics/diamt_finish.png")
