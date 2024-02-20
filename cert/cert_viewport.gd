extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var date = OS.get_date()
	$background/name.text = capitalize_words(Global.hoten)
	$background/mssv.text = Global.mssv
	$background/date.text = str(date.day) + "/" + str(date.month) + "/" + str(date.year)
	$background/diem.text = "đã trả lời đúng " + str(Global.diem) + "/8 câu trắc nghiệm"
func capitalize_words(text: String):
	text = text.to_lower()
	return text.capitalize()
