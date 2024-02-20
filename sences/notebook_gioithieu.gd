extends TextureRect

var index =0
var prev_click = false
var next_click = false
var intro_ismute = true

var intro = {
	"text0": "Để tiến hành các test khác nhau nhằm định danh vi sinh vật, cần phân lập và làm thuần chủng vi sinh. Đặc biệt, các test sinh hóa hoặc giải trình tự dựa trên khuếch đại gen bằng các cặp mồi chung (universal primer) chỉ có hiệu lực (đúng) khi sử dụng chủng thuần.",
	"img0": "res://intro/img0.jpg",
	"voice0": "res://sound/voice1.mp3",
	"text1": "Phương pháp “CẤY RIA” thường được sử dụng trong phân lập vi sinh vật từ một hỗn hợp (đất, nước, mẫu bệnh phẩm…) hoặc một mẫu được nuôi cấy (lỏng hoặc rắn/thạch/agar)",
	"img1": "res://intro/img1.jpg",
	"voice1": "res://sound/voice2.mp3",
	"text2": "Vi sinh vật phát triển trên môi trường thạch rắn sẽ hình thành các khuẩn lạc, mỗi một khuẩn lạc được hình thành từ một tế bào vi sinh riêng lẻ. Do vậy, một khuẩn lạc đơn lẻ có thể được coi là một dòng thuần. Quá trình làm thuần vi khuẩn thường được thực hiện qua 2-3 lần cấy ria từ các khuẩn lạc đơn lẻ và thu nhận khuẩn lạc đơn lẻ",
	"img2": "res://intro/img2.jpg",
	"voice2": "res://sound/voice3.mp3",
	"text3": "Kỹ thuật cấy ria làm thuần vi sinh khuẩn hoặc nấm men thường được thực hiện bao gồm ria 3 chiều hoặc ria 4 chiều; có thể cấy các đường cấy zic-zac hoặc các đường cấy song song nhau",
	"img3": "res://intro/img3.jpg",
	"voice3": "res://sound/voice4.mp3",
	"text4": "Trong Bài thực hành ảo phương pháp cấy ria, các em sẽ làm quen với phương pháp đơn giản nhất là cấy ria 3 chiều và cấy theo phương pháp zic-zac",
	"img4": "res://intro/img4.jpg",
	"voice4": "res://sound/voice5.mp3",
}

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#READY
func _ready():
	$prev.visible = false
	$page_p.text = str(index*2+1)
	$page_n.text = str(index*2+2)
	$voice.stream = load(intro["voice"+str(index)])
#PROCESSING
func _process(delta):
	#Hien thi noi dung theo gia tri cua index
	$img.texture = load(intro["img"+str(index)])
	$text.text = intro["text"+str(index)]
	
#INPUT

#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#BUTTON PREV NEXT SPEAKER
	
func _on_prev_pressed():
	print(index)
	index -=1
	if index<1:
		index = 0
		$prev.visible = false
		$next.visible = true
	$next.visible = true
	$sound_click.playing = true
	$voice.stream = load(intro["voice"+str(index)])
	if intro_ismute:
		$voice.stream_paused = true
		$voice.playing = false
	elif !intro_ismute:
		$voice.stream_paused = false
		$voice.playing = true
	$page_p.text = str(index*2+1)
	$page_n.text = str(index*2+2)
	
func _on_next_pressed():
	#print(index)
	index +=1
	if index>3:
		index=4
		$next.visible = false
		$prev.visible = true
	$prev.visible = true
	$sound_click.playing = true
	$voice.stream = load(intro["voice"+str(index)])
	if intro_ismute:
		$voice.stream_paused = true
		$voice.playing = false
	elif !intro_ismute:
		$voice.stream_paused = false
		$voice.playing = true
	$page_p.text = str(index*2+1)
	$page_n.text = str(index*2+2)

func _on_intro_speaker_pressed():
	intro_ismute = not (intro_ismute)
	if intro_ismute:
		$voice.stream_paused = true
		$voice.playing = false
	elif !intro_ismute:
		$voice.stream_paused = false
		$voice.playing = true
