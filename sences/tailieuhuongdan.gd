extends TextureRect

var index =0
var prev_click = false
var next_click = false
var intro_ismute = true

var tlhd = {
	"text0": "Khử trùng (hơ) que cấy vòng trên ngọn lửa, và để que cấy nguội.",
	"img0": "res://guide/step1.png",
	
	"text1": "Lấy 1 khuẩn lạc đơn lẻ từ đĩa agar, chú ý lấy khuẩn lạc riêng lẻ nằm trên đường cấy số 3",
	"img1": "res://guide/step2.png",
	
	"text2": "Khuẩn lạc có thể được lấy từ lọ vi khuẩn (dạng dung dịch)",
	"img2": "res://guide/step22.png",
	
	"text3": "Cấy đường cấy đầu tiên ở 1 góc đĩa agar mới - vùng cấy số 1. (đường cấy zic-zac)",
	"img3": "res://guide/step3.png",
	
	"text4": "Khử trùng que cấy vòng trên ngọn lửa, và để que cấy nguội.",
	"img4": "res://guide/step4.png",
	
	"text5": "Nhẹ nhàng kéo que cấy theo đường zic-zac đi từ vùng cấy đầu tiên, sau đó tiếp tục zic-zac ở vùng số 2, các đường zic-zac nên thưa hơn ở vùng 1 và ngày càng thưa dần.)",
	"img5": "res://guide/step5.png",
	
	"text6": "Khử trùng que cấy vòng trên ngọn lửa, và để que cấy nguội. Lặp lại bước 4 nhưng kéo từ vùng cấy số 2 sang vùng cấy số 3",
	"img6": "res://guide/step6.png",
	
	"text7": "Bỏ đĩa cấy vào trong tủ cấy và tiến hành ủ",
	"img7": "res://guide/step7.png",
	
	"text8": "Ủ đĩa trong điều kiện nuôi cấy thích hợp sử dụng tủ nuôi cấy vi sinh",
	"img8": "res://guide/step8.png",
	
	"text9": "Quan sát kết quả nuôi cấy vi sinh vật.",
	"img9": "res://guide/step9.png",
}

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#READY
func _ready():
	$prev.visible = false
	$page_p.text = str(index*2+1)
	$page_n.text = str(index*2+2)

#PROCESSING
func _process(delta):
	#Hien thi noi dung theo gia tri cua index
	$img.texture = load(tlhd["img"+str(index)])
	$text.text = tlhd["text"+str(index)]
	
#INPUT

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#BUTTON PREV NEXT SPEAKER
	
func _on_prev_pressed():
	#print(index)
	index -=1
	if index<1:
		index = 0
		$prev.visible = false
		$next.visible = true
	$sound_click.playing = true
	$page_p.text = str(index*2+1)
	$page_n.text = str(index*2+2)
	$next.visible = true
	
func _on_next_pressed():
	#print(index)
	index +=1
	if index>8:
		index=9
		$prev.visible = true
		$next.visible = false
	$sound_click.playing = true
	$page_p.text = str(index*2+1)
	$page_n.text = str(index*2+2)
	$prev.visible = true
func _on_intro_speaker_pressed():
	intro_ismute = not (intro_ismute)

