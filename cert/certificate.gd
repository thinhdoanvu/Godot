extends Control

func _process(delta):
	$render.texture = $Viewport.get_texture()
	pass

func _on_download_but_button_up():
	var image: Image = $Viewport.get_texture().get_data()
	JavaScript.download_buffer(image.save_png_to_buffer(),"cert.png","image/png")
