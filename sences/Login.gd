extends Node
var hoten_mssv = ""
#onready var file = "res://sences/user.txt"
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
func _ready():
	$but_login.disabled = true
	$but_clear.disabled = true
	$txt_Hoten.readonly = false
	$txt_MSSV.readonly = false
	$fadein.play("run")
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#	
func _process(delta):
	if len($txt_Hoten.text) == 0 && len($txt_MSSV.text) == 0:
		$but_login.disabled = true
		$but_clear.disabled = true
	else:
		$but_login.disabled = false
		$but_clear.disabled = false
		
	if $error.visible == true:
		$but_login.disabled = true
		$but_clear.disabled = true
		$txt_Hoten.readonly = true
		$txt_MSSV.readonly = true
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
func write_file(file_name, string):
	var file = File.new()
	file.open(file_name, File.WRITE)
	file.store_string(string)
	file.close()
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#ERROR
func _on_error_close_button_up():
	$error.visible = false
	#Enable button login va clear
	$but_login.disabled = false
	$but_clear.disabled = false
	$txt_Hoten.readonly = false
	$txt_MSSV.readonly = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#LOGIN
func _on_but_login_button_up():
	$sound_click.playing=true
	if $txt_Hoten.text == "" || $txt_MSSV.text == "":
		$error/error_label.text = "Lưu ý: Họ và tên, Mã số SV không được để trống"
		$error/error_label.ALIGN_CENTER
		$error.visible = true
		#Dective login, clear button
		$but_login.disabled = true
		$but_clear.disabled = true
		
	elif len($txt_Hoten.text)>0 && len($txt_MSSV.text)<8:
		$error/error_label.text = "Mã số SV phải đầy đủ 8 ký tự"
		$error/error_label.ALIGN_CENTER
		$error.visible = true
		#Dective login, clear button
		$but_login.disabled = true
		$but_clear.disabled = true
		
	else:#login thanh cong
		hoten_mssv = $txt_Hoten.text + "," + $txt_MSSV.text
		Global.hoten = $txt_Hoten.text
		Global.mssv = $txt_MSSV.text
		#write_file(file, hoten_mssv)
		get_tree().change_scene("res://sences/Homepage.tscn")
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#CLEAR
func _on_but_clear_button_up():
	$sound_click.playing=true
	$txt_Hoten.text = "" 
	$txt_MSSV.text = ""
	#Dective clear, active login button
	$but_login.disabled = false
	$but_clear.disabled = true
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#TEXT CHANGE
#func _on_txt_Hoten_text_changed():
	#hoten_mssv = $txt_Hoten.text
	
#func _on_txt_MSSV_text_changed():
	#hoten_mssv = hoten_mssv + "," + $txt_MSSV.text
