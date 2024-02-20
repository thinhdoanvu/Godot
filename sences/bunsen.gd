extends Sprite

onready var quecay = get_parent().get_node("quecay")
onready var dauque = get_parent().get_node("quecay/dauque")
onready var vikhuan = get_parent().get_node("quecay/vikhuan")
onready var diemcuoi = get_parent().get_node("diemcuoi")

var is_cham = false
var calcu =0

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#READY
func _ready():
	pass # Replace with function body.
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	if $fire.visible:
		if quecay.position.x >1058 && quecay.position.x < 1110:
			if quecay.position.y >174 && quecay.position.y <279:
				is_cham = true
			else:
				is_cham = false
		else:
			is_cham = false
	else:
		is_cham = false
	#Truong hop co va cham
	if is_cham:
		calcu=calcu+1
		yield(get_tree().create_timer(0.5),"timeout")
		#dauque.material.set_shader_param("click",true)
	else:
		calcu=0
		#dauque.material.set_shader_param("click",false)
	
	#Tinh toan thoi gian dau que bi ho nong
	if calcu>50 && $fire.visible:
		dauque.material.set_shader_param("click", true)
		#bat bit kiem tra da khu khuan
		quecay.iskhukhuan = true
		#thu nho den kho -> an den kho di
		
#		yield(get_tree().create_timer(1.0),"timeout")
#		$fire.visible = false
		
		#kiem tra neu co vi khuan dinh da do thi tat di
		if vikhuan.visible:
			#hieu ung bien mat vi khuan
			yield(get_tree().create_timer(0.1),"timeout")
			vikhuan.scale.x = lerp(vikhuan.scale.x,0,0.1)
			vikhuan.scale.y = lerp(vikhuan.scale.y,0,0.1)
		#tat dau do khi khong co vi khuan
		yield(get_tree().create_timer(1.5),"timeout")
		dauque.material.set_shader_param("click", false)
		quecay.iskhukhuan = true
		quecay.l2_khukhuan = true
		quecay.l3_khukhuan = true
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#AREA
func _on_ar_bunsen_area_entered(area):
	if !quecay.iskhukhuan && area.name == "ar_dauque" && $fire.visible:
		is_cham = true
	
func _on_ar_bunsen_area_exited(area):
	is_cham = false
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#BUTTON
func _on_but_bunsen_button_up():
	get_parent().get_node("sound_click").playing = true
	$fire.visible = not ($fire.visible)
	$fire.playing = not ($fire.playing)
	$but_bunsen.visible = false
