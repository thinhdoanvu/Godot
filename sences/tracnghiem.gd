extends TextureRect

onready var lbl_a = $details/vframe/hframe_a/lbl_a
onready var lbl_b = $details/vframe/hframe_b/lbl_b
onready var lbl_c = $details/vframe/hframe_c/lbl_c
onready var lbl_d = $details/vframe/hframe_d/lbl_d
onready var ans_a = $details/vframe/hframe_a/check_ansa
onready var ans_b = $details/vframe/hframe_b/check_ansb
onready var ans_c = $details/vframe/hframe_c/check_ansc
onready var ans_d = $details/vframe/hframe_d/check_ansd

var index =0
var prev_click = false
var next_click = false
var score = 0

var question = {
	"text0": "Trong quá trình thực hiện cấy ria, vi khuẩn từ mẫu hoặc từ mẫu nuôi cấy được lấy ... lần?",
	"img0": "res://quizz/img0.png",
	"a0": "A. 1",
	"b0": "B. 2",
	"c0": "C. 3",
	"d0": "D. 0",
	
	"text1": "Bằng cách nào chúng ta biết rằng chúng ta cấy ria thành công hay chưa?",
	"img1": "res://quizz/img1.png",
	"a1": "A. Khi đĩa cấy có vi khuẩn mọc.",
	"b1": "B. Khi đĩa cấy có các khuẩn lạc được hình thành.",
	"c1": "C. Khi đĩa cấy có các khuẩn lạc mọc rời rạc tách biệt nhau.",
	"d1": "D. Khi các khuẩn lạc có màu sắc giống hoặc khác với đĩa cấy gốc.",
	
	"text2": "Phát biểu nào phù hợp khi nói về kết quả cấy của 3 đĩa cấy ria như hình bên dưới?",
	"img2": "res://quizz/img2.png",
	"a2": "A. Cả 3 đĩa cấy ria đều đạt",
	"b2": "B. Cả 3 đĩa cấy ria đều không đạt",
	"c2": "C. Đĩa A,C đều đạt",
	"d2": "D. Chỉ có đĩa C đạt",
	
	"text3": "Phát biểu nào phù hợp khi nói về kết quả cấy của 3 đĩa cấy ria như hình bên dưới?",
	"img3": "res://quizz/img3.png",
	"a3": "A. Đĩa cấy B không thành công vì người thao tác đã quên khử trùng vòng cấy giữa các vùng cấy, hoặc sau khi khử trùng vòng cấy lại tiếp tục lấy mẫu",
	"b3": "B. Đĩa cấy A không thành công vì người thao tác đã quên khử trùng vòng cấy giữa các vùng cấy, hoặc sau khi khử trùng vòng cấy lại tiếp tục lấy mẫu",
	"c3": "C. Đĩa cấy C không thành công vì người thao tác đã quên khử trùng vòng cấy giữa các vùng cấy, hoặc sau khi khử trùng vòng cấy lại tiếp tục lấy mẫu",
	"d3": "D. Tất cả các đĩa cấy đều rất đẹp",
	
	"text4": "Điều gì sẽ xảy ra nếu vòng cấy quá nóng ở bước lấy vi khuẩn (nhúng que cấy vòng vào dịch mẫu hoặc đĩa khuẩn gốc)?",
	"img4": "res://quizz/img4.png",
	"a4": "A. Không thu nhận được khuẩn lạc rời rạc.",
	"b4": "B. Đĩa thạch không xuất hiện khuẩn cần phân lập.",
	"c4": "C. Vi khuẩn bị stress và đột biến.",
	"d4": "D. Mọi việc đều diễn ra bình thường vì vi khuẩn chịu nóng tốt.",
	
	"text5": "Trên đĩa thạch sử dụng cấy ria, nếu đúng kỹ thuật, đường cấy nào mọc ít khuẩn lạc nhất?",
	"img5": "res://quizz/img5.png",
	"a5": "A. Đường cấy 1",
	"b5": "B. Đường cấy 2",
	"c5": "C. Đường cấy cuối",
	"d5": "D. Các đường cấy đều có số khuẩn lạc như nhau",
	
	"text6": "Ưu điểm của phương pháp cấy ria là gì?",
	"img6": "res://quizz/img6.png",
	"a6": "A. Làm thuần vi sinh vật",
	"b6": "B. Định lượng (đếm) được số lượng vi khuẩn",
	"c6": "C. Định tính vi khuẩn",
	"d6": "D. Định danh được vi khuẩn",
	
	"text7": "Trong phương pháp cấy ria phân lập vi khuẩn, loại que cấy nào được sử dụng?",
	"img7": "res://quizz/img7.png",
	"a7": "A. Que cấy trang",
	"b7": "B. Que cấy vòng",
	"c7": "C. Que cấy thẳng",
	"d7": "D. Que cấy tam giác",
}

var ans_question = {
	"a0":false,
	"b0":false,
	"c0":false,
	"d0":false,
	"a1":false,
	"b1":false,
	"c1":false,
	"d1":false,
	"a2":false,
	"b2":false,
	"c2":false,
	"d2":false,
	"a3":false,
	"b3":false,
	"c3":false,
	"d3":false,
	"a4":false,
	"b4":false,
	"c4":false,
	"d4":false,
	"a5":false,
	"b5":false,
	"c5":false,
	"d5":false,
	"a6":false,
	"b6":false,
	"c6":false,
	"d6":false,
	"a7":false,
	"b7":false,
	"c7":false,
	"d7":false,
}

var correct_ans = {
	"a0": true,
	"b0": false,
	"c0": false,
	"d0": false,
	"a1": false,
	"b1": false,
	"c1": true,
	"d1": false,
	"a2": false,
	"b2": false,
	"c2": false,
	"d2": true,
	"a3": true,
	"b3": false,
	"c3": false,
	"d3": false,
	"a4": false,
	"b4": true,
	"c4": false,
	"d4": false,
	"a5": false,
	"b5": false,
	"c5": true,
	"d5": false,
	"a6": true,
	"b6": false,
	"c6": false,
	"d6": false,
	"a7": false,
	"b7": true,
	"c7": false,
	"d7": false,
}
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#PROCESSING
func _process(delta):
	#Hien thi noi dung theo gia tri cua index
	$vframe_ques/img.texture = load(question["img"+str(index)])
	$vframe_ques/cur_question.text = question["text"+str(index)]
	lbl_a.text = question["a"+str(index)]
	lbl_b.text = question["b"+str(index)]
	lbl_c.text = question["c"+str(index)]
	lbl_d.text = question["d"+str(index)]
	
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#BUTTON PREV
func _on_next_pressed():
	index +=1
	if index>7:
		index=0
	$sound_click.playing = true
	#Doc gia tri cau tra loi vao cac nut
	ans_a.pressed = ans_question["a"+str(index)]
	ans_b.pressed = ans_question["b"+str(index)]
	ans_c.pressed = ans_question["c"+str(index)]
	ans_d.pressed = ans_question["d"+str(index)]
#BUTTON NEXT
func _on_prev_pressed():
	index -=1
	if index<0:
		index=7
	$sound_click.playing = true
	#Doc gia tri cau tra loi vao cac nut
	ans_a.pressed = ans_question["a"+str(index)]
	ans_b.pressed = ans_question["b"+str(index)]
	ans_c.pressed = ans_question["c"+str(index)]
	ans_d.pressed = ans_question["d"+str(index)]
#BUTTON FINISH
func _on_finish_pressed():
	$sound_click.playing = true
	$dialog.visible = true
	ans_a.disabled = true
	ans_b.disabled = true
	ans_c.disabled = true
	ans_d.disabled = true
	$prev.disabled = true
	$next.disabled = true
	$finish.disabled = true
#BUTTON NO
func _on_no_dialog_pressed():
	$dialog.visible = false
	$sound_click.playing = true
	ans_a.disabled = false
	ans_b.disabled = false
	ans_c.disabled = false
	ans_d.disabled = false
	$prev.disabled = false
	$next.disabled = false
	$finish.disabled = false
	score = 0
#BUTTON YES
func _on_yes_dialog_pressed():
	for i in 8:
		if ans_question["a"+str(i)] == correct_ans["a"+str(i)] && ans_question["b"+str(i)] == correct_ans["b"+str(i)] && ans_question["c"+str(i)] == correct_ans["c"+str(i)] && ans_question["d"+str(i)] == correct_ans["d"+str(i)]:
			score += 1
	#Hien thi diem so
	$dialog/lbl_dialog.text = "Bạn trả lời đúng " + str(score) + "/8 câu hỏi. Xin cảm ơn"
	#Thoat cau trac nghiem
	$dialog/yes_dialog.disabled = true
	$dialog/no_dialog.disabled = true
	#luu diem so
	Global.diem = score
	#Goi cua so giay khen
	yield(get_tree().create_timer(3),"timeout")
	get_tree().change_scene("res://cert/certificate.tscn")
#=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.#
#BUTTON A
func _on_check_ansa_toggled(button_pressed):
	if button_pressed:
		for child in get_tree().get_nodes_in_group("group_ans"):
			if child.name != "check_ansa":
				#print(child.name)
				child.pressed = false
				#Save ans to ans_question
				ans_question["a"+str(index)] = ans_a.pressed
				ans_question["b"+str(index)] = ans_b.pressed
				ans_question["c"+str(index)] = ans_c.pressed
				ans_question["d"+str(index)] = ans_d.pressed
#BUTTON B
func _on_check_ansb_toggled(button_pressed):
	if button_pressed:
		for child in get_tree().get_nodes_in_group("group_ans"):
			if child.name != "check_ansb":
				#print(child.name)
				child.pressed = false
				#Save ans to ans_question
				ans_question["a"+str(index)] = ans_a.pressed
				ans_question["b"+str(index)] = ans_b.pressed
				ans_question["c"+str(index)] = ans_c.pressed
				ans_question["d"+str(index)] = ans_d.pressed
#BUTTON C
func _on_check_ansc_toggled(button_pressed):
	if button_pressed:
		for child in get_tree().get_nodes_in_group("group_ans"):
			if child.name != "check_ansc":
				#print(child.name)
				child.pressed = false
				#Save ans to ans_question
				ans_question["a"+str(index)] = ans_a.pressed
				ans_question["b"+str(index)] = ans_b.pressed
				ans_question["c"+str(index)] = ans_c.pressed
				ans_question["d"+str(index)] = ans_d.pressed
#BUTTON D
func _on_check_ansd_toggled(button_pressed):
	if button_pressed:
		for child in get_tree().get_nodes_in_group("group_ans"):
			if child.name != "check_ansd":
				#print(child.name)
				child.pressed = false
				#Save ans to ans_question
				ans_question["a"+str(index)] = ans_a.pressed
				ans_question["b"+str(index)] = ans_b.pressed
				ans_question["c"+str(index)] = ans_c.pressed
				ans_question["d"+str(index)] = ans_d.pressed
