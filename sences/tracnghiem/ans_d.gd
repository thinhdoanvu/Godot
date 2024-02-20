extends CheckBox

func _on_check_ansd_toggled(button_pressed):
	if button_pressed:
		for child in get_parent().get_children():
			if child.name != self.name:
				#print(child.name)
				child.pressed = false
