extends Node2D

var diavk_zoomin = false
var diamt_zoomin = false
var quecay_zoomin = false
var bunsen_zoomin = false
var hide_click = false
var hoten_mssv = ""
#onready var file = "res://sences/user.txt"
var gioithieu_zoomin = false
var huongdan_zoomin = false
var thuchanh1_zoomin = false
var thuchanh2_zoomin = false
var kiemtra_zoomin = false
#bai thuc hanh 1
var is_link2baithuchhanh1 = false
#bai thuc hanh 2
var is_link2baithuchhanh2 = false
#Khung gioi thieu
var open_gioithieu = false
#Khung tai lieu huong dan
var open_tailieuhuongdan = false
#bai tap trac nghiem
var open_baitaptracnghiem = false
#Speaker
var ismute = false


#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
func _ready():
	$gioithieu.rect_position.y = 800
	$huongdan.rect_position.y = 800
	$thuchanh1.rect_position.y = 800
	$thuchanh2.rect_position.y = 800
	$kiemtra.rect_position.y = 800
	$lbl_detail.ALIGN_CENTER
	$sound.volume_db = 0
	$bunsen/anm_bunsen.play("fire")
	#Hien thi ho ten
	#load_file(file)
	$hoten.text = Global.hoten
	$mssv.text = Global.mssv
	#
	yield(get_tree().create_timer(1.0),"timeout")
	$fadein.play("fadein")
	
	#GIOI THIEU
	$notebook_gioithieu.visible = false
	
	#Kiem tra trang thai cua khung gioi thieu
	if Global.voigioithieu:
		#SPEAKER
		$voice_welcome.playing = true
		#TYPER WRITER TEXT
		$detail.visible = true
		$lbl_intro.visible = true
		$intro_text.play("run")
		$but_hide_welcome.visible = true
	#thiet lap trang thai da mo voice gioi thieu
	Global.voigioithieu = false
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
	#print(hoten_mssv)
	#Tach du lieu va luu va data
	for i in len(hoten_mssv) - 9:
		$hoten.text = $hoten.text + hoten_mssv[i]
	for i in range(len(hoten_mssv) - 8,len(hoten_mssv)):
		$mssv.text = $mssv.text + hoten_mssv[i]
	return
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
func _process(delta):
	#Load hinh anh cho cac icon cua thanh menu
	if !Global.gioithieu:
		$gioithieu.texture = load("res://pics/gioithieu_grey.png")
	if Global.gioithieu:
		$gioithieu.texture = load("res://pics/gioithieu.png")
	if !Global.tailieuhuongdan:
		$huongdan.texture = load("res://pics/huongdan_grey.png")
	if Global.tailieuhuongdan:
		$huongdan.texture = load("res://pics/huongdan.png")
	if !Global.thuchanh1:
		$thuchanh1.texture = load("res://pics/thuchanh1_grey.png")
	if Global.thuchanh1:
		$thuchanh1.texture = load("res://pics/thuchanh1.png")
	if !Global.thuchanh2:
		$thuchanh2.texture = load("res://pics/thuchanh2_grey.png")
	if Global.thuchanh2:
		$thuchanh2.texture = load("res://pics/thuchanh2.png")
	if !Global.tracnghiem:
		$kiemtra.texture = load("res://pics/kiemtra_grey.png")
	if Global.tracnghiem:
		$kiemtra.texture = load("res://pics/kiemtra.png")
		
	#ZOOM IN
	if gioithieu_zoomin:
		$ghichu.rect_position=Vector2(956,76)
		$ghichu/lbl_ghichu.text = "Giới thiệu"
		$ghichu.visible = true
		$ghichu.rect_scale.x = lerp($ghichu.rect_scale.x,1,0.05)
		$ghichu.rect_scale.y = lerp($ghichu.rect_scale.y,1,0.05)
	
	elif huongdan_zoomin:
		$ghichu.rect_position=Vector2(956,176)
		$ghichu/lbl_ghichu.text = "Tài liệu hướng dẫn"
		$ghichu.visible = true
		$ghichu.rect_scale.x = lerp($ghichu.rect_scale.x,1,0.05)
		$ghichu.rect_scale.y = lerp($ghichu.rect_scale.y,1,0.05)
	
	elif thuchanh1_zoomin:
		$ghichu.rect_position=Vector2(956,276)
		$ghichu/lbl_ghichu.text = "Bài thực hành 1"
		$ghichu.visible = true
		$ghichu.rect_scale.x = lerp($ghichu.rect_scale.x,1,0.05)
		$ghichu.rect_scale.y = lerp($ghichu.rect_scale.y,1,0.05)
		is_link2baithuchhanh1 = true
	
	elif thuchanh2_zoomin:
		$ghichu.rect_position=Vector2(956,376)
		$ghichu/lbl_ghichu.text = "Bài thực hành 2"
		$ghichu.visible = true
		$ghichu.rect_scale.x = lerp($ghichu.rect_scale.x,1,0.05)
		$ghichu.rect_scale.y = lerp($ghichu.rect_scale.y,1,0.05)
	
	elif kiemtra_zoomin:
		$ghichu.rect_position=Vector2(956,476)
		$ghichu/lbl_ghichu.text = "Kiểm tra kiến thức"
		$ghichu.visible = true
		$ghichu.rect_scale.x = lerp($ghichu.rect_scale.x,1,0.05)
		$ghichu.rect_scale.y = lerp($ghichu.rect_scale.y,1,0.05)
		
	elif !gioithieu_zoomin || !huongdan_zoomin || !thuchanh1_zoomin || !thuchanh2_zoomin || !kiemtra_zoomin:
		$ghichu.rect_scale.x = lerp($ghichu.rect_scale.x,0,0.05)
		$ghichu.rect_scale.y = lerp($ghichu.rect_scale.y,0,0.05)
	
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#INPUT
func _input(event: InputEvent):
	#nhan chuot trai de zoomin dia vi khuan
	if event is InputEventMouse:
		if event.is_pressed() && event.get_button_index() == 1:
			if diavk_zoomin:
				$zoomin.visible = true
				$hide.visible = true
				$but_hide.visible = true
				$zoomin.texture = null #Xoa hinh
				$zoomin.texture = load("res://pics/diavk.png")
				$sound_click.playing = true
				$lbl_detail.text = "Đĩa vi khuẩn gốc ban đầu"
				$lbl_detail.visible = true
				$detail.visible = true
				#Voice 6
				$voice.stream_paused = false
				$voice.stream = load("res://intro/voice6.mp3")
				$voice.playing = true
			#nhan chuot trai de zoomin dia moi truong
			if diamt_zoomin:
				$zoomin.visible = true
				$hide.visible = true
				$but_hide.visible = true
				$zoomin.texture = null #Xoa hinh
				$zoomin.texture = load("res://pics/diamt.png")
				$sound_click.playing = true
				$lbl_detail.text = "Đĩa môi trường dinh dưỡng mới, dùng cho một lần phân lập, nuôi cấy mới"
				$lbl_detail.visible = true
				$detail.visible = true
				#Voice 7
				$voice.stream_paused = false
				$voice.stream = load("res://intro/voice7.mp3")
				$voice.playing = true
				
			#nhan chuot trai de zoomin que cay
			if quecay_zoomin:
				$zoomin.visible = true
				$hide.visible = true
				$but_hide.visible = true
				$zoomin.texture = null #Xoa hinh
				$zoomin.texture = load("res://pics/quecay_zoom.png")
				$sound_click.playing = true
				$lbl_detail.text = "Que cấy vòng"
				$lbl_detail.visible = true
				$detail.visible = true
				#Voice 8
				$voice.stream_paused = false
				$voice.stream = load("res://intro/voice8.mp3")
				$voice.playing = true
			#nhan chuot trai de zoomin den bunsen
			if bunsen_zoomin:
				$zoomin.visible = true
				$hide.visible = true
				$but_hide.visible = true
				$zoomin.texture = null #Xoa hinh
				$zoomin.texture = load("res://pics/bunsen_zoom.png")
				$sound_click.playing = true
				$lbl_detail.text = "Đèn Bunsen hay Bunsen Burner"
				$detail.visible = true
				$lbl_detail.visible = true
				#Voice 9
				$voice.stream_paused = false
				$voice.stream = load("res://intro/voice9.mp3")
				$voice.playing = true
			#Hien thi khung gioi thieu
			if open_gioithieu:
				$hide.visible = true
				$but_hide.visible = true
				gioithieu_zoomin = false #khung tieu de cua menu
				$notebook_gioithieu.visible = true
				$sound_click.playing = true
				#thiet lap thuoc tinh trang gioi thieu da mo
				Global.gioithieu = true
			
			#Hien thi khung tai lieu huong dan
			if open_tailieuhuongdan:
				if Global.gioithieu:
					$hide.visible = true
					$but_hide.visible = true
					huongdan_zoomin = false #khung tieu de cua menu
					$tailieuhuongdan.visible = true
					$sound_click.playing = true
					#thiet lap thuoc tinh trang gioi thieu da mo
					Global.tailieuhuongdan = true
				else:
					pass
					
			#Mo bai thuc hanh 1
			if is_link2baithuchhanh1:
				if Global.tailieuhuongdan:
					$sound_click.playing = true
					get_tree().change_scene("res://sences/thuchanh1.tscn")
					#thiet lap thuoc tinh trang gioi thieu da mo
					Global.thuchanh1 = true
				else:
					pass
			
			#Mo bai thuc hanh 2
			if is_link2baithuchhanh2:
				if Global.thuchanh1:
					$sound_click.playing = true
					get_tree().change_scene("res://sences/thuchanh2.tscn")
					#thiet lap thuoc tinh trang gioi thieu da mo
					Global.thuchanh2 = true
				else:
					pass
						
			#Hien thi phan bai tap trac nghiem
			if open_baitaptracnghiem:
				if Global.thuchanh2:
					$hide.visible = true
					$but_hide.visible = true
					kiemtra_zoomin = false #khung tieu de cua menu
					$tracnghiem.visible = true
					$sound_click.playing = true
					#thiet lap thuoc tinh trang gioi thieu da mo
					Global.tracnghiem = true
				else:
					pass
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#Dia vi khuan
func _on_ar_diavk_mouse_entered():
	$lbl_intro.visible = false
	$diavk.material.set_shader_param("click", true)
	$sound.playing = true
	
	#bat chuc nang zoom in
	diavk_zoomin = true
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = false

func _on_ar_diavk_mouse_exited():
	$diavk.material.set_shader_param("click", false)
	#tat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = false
	if $but_hide.visible:
		$detail.visible = true
		$lbl_detail.visible = true
	else:
		$detail.visible = false
		$lbl_detail.visible = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#Dia moi truong
func _on_ar_diamt_mouse_entered():
	$lbl_intro.visible = false
	$diamt.material.set_shader_param("click", true)
	$sound.playing = true
	
	#bat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = true
	quecay_zoomin = false
	bunsen_zoomin = false

func _on_ar_diamt_mouse_exited():
	$diamt.material.set_shader_param("click", false)
	#tat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = false
	if $but_hide.visible:
		$detail.visible = true
		$lbl_detail.visible = true
	else:
		$detail.visible = false
		$lbl_detail.visible = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#Que cay
func _on_ar_quecay_mouse_entered():
	$lbl_intro.visible = false
	$quecay.material.set_shader_param("click", true)
	$sound.playing = true
	
	#bat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = true
	bunsen_zoomin = false

func _on_ar_quecay_mouse_exited():
	$quecay.material.set_shader_param("click", false)
	#tat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = false
	if $but_hide.visible:
		$detail.visible = true
		$lbl_detail.visible = true
	else:
		$detail.visible = false
		$lbl_detail.visible = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#Den bunsen
func _on_ar_bunsen_mouse_entered():
	$lbl_intro.visible = false
	$sound.playing = true
	$bunsen.material.set_shader_param("click", true)
	
	#bat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = true

func _on_ar_bunsen_mouse_exited():
	$bunsen.material.set_shader_param("click", false)
	#tat chuc nang zoom in
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = false
	if $but_hide.visible:
		$detail.visible = true
		$lbl_detail.visible = true
	else:
		$detail.visible = false
		$lbl_detail.visible = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#Button an chuc nang phong to thiet bi
func _on_but_hide_button_up():
	$detail.visible = false
	$lbl_detail.visible = false
	$intro_text.play("RESET")
	$sound_click.playing = true
	$zoomin.texture = null
	$zoomin.visible = false
	$hide.visible = false
	$but_hide.visible = false
	diavk_zoomin = false
	diamt_zoomin = false
	quecay_zoomin = false
	bunsen_zoomin = false
	#tat tieng file gioi thiu mau vat
	$voice.stream_paused = true
	
	#GIOI THIEU
	$notebook_gioithieu.visible = false
	
	#TAI LIEU HUONG DAN
	$tailieuhuongdan.visible = false
	
	#BAI TAP TRAC NGHIEM
	$tracnghiem.visible = false
	
	#Tat tieng
	$notebook_gioithieu/voice.stream_paused = true
	$notebook_gioithieu.index = 0
	$voice_welcome.stop()
	$lbl_intro.visible = false

#HIDE WELCOME 
func _on_but_hide_welcome_pressed():
	$but_hide_welcome.visible = false
	$detail.visible = false
	$lbl_detail.visible = false
	$intro_text.play("RESET")
	$sound_click.playing = true
	$zoomin.texture = null
	$zoomin.visible = false
	$hide.visible = false
	#Tat tieng
	$notebook_gioithieu/voice.stream_paused = true
	$notebook_gioithieu.index = 0
	$voice_welcome.stop()
	$lbl_intro.visible = false
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#DANH CHO MENU
func _on_gioithieu_mouse_entered():
	if !$but_hide.visible:
		$sound.playing = true
		gioithieu_zoomin = true
		open_gioithieu = true
func _on_gioithieu_mouse_exited():
		gioithieu_zoomin = false
		open_gioithieu = false

func _on_huongdan_mouse_entered():
	if !$but_hide.visible:
		$sound.playing = true
		huongdan_zoomin = true
		open_tailieuhuongdan = true
func _on_huongdan_mouse_exited():
	huongdan_zoomin = false
	open_tailieuhuongdan = false
	
func _on_thuchanh1_mouse_entered():
	if !$but_hide.visible:
		$sound.playing = true
		thuchanh1_zoomin = true
func _on_thuchanh1_mouse_exited():
	thuchanh1_zoomin = false
	is_link2baithuchhanh1 = false

func _on_thuchanh2_mouse_entered():
	if !$but_hide.visible:
		$sound.playing = true
		thuchanh2_zoomin = true
		is_link2baithuchhanh2 = true
func _on_thuchanh2_mouse_exited():
	thuchanh2_zoomin = false
	is_link2baithuchhanh2 = false

func _on_kiemtra_mouse_entered():
	if !$but_hide.visible:
		$sound.playing = true
		kiemtra_zoomin = true
		open_baitaptracnghiem = true
func _on_kiemtra_mouse_exited():
	kiemtra_zoomin = false
	open_baitaptracnghiem = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#DANH CHO SPEAKER
func _on_speaker_pressed():
	$but_hide_welcome.visible = true
	#print(ismute)
	ismute = not (ismute)
	if ismute:
		$intro_text.play("RESET")
		$voice_welcome.playing = false
		$detail.visible = true
		$lbl_intro.visible = true
		$intro_text.play("run")
	elif !ismute:
		$intro_text.play("RESET")
		$voice_welcome.stream_paused = false
		$voice_welcome.playing = true
		$detail.visible = true
		$lbl_intro.visible = true
		$intro_text.play("run")
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#HET ANIMATION
func _on_intro_text_animation_finished(anim_name):
	if anim_name == "run":
		#$but_hide_welcome.visible = false
		$but_hide_welcome.visible = true
	
	
	
