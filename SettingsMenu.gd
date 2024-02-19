extends Panel

var volume_value = 0
var fullscreen_mode : int

func _ready():
	$VolumeSlider.value = volume_value

func _on_volume_changed(value):
	volume_value = value
	# Применить изменения громкости
	apply_settings()

func _on_fullscreen_toggled(value):
	if value == true:
		fullscreen_mode = DisplayServer.WINDOW_MODE_FULLSCREEN
	else:
		fullscreen_mode = DisplayServer.WINDOW_MODE_WINDOWED
	# Применить изменения полноэкранного режима
	apply_settings()

func apply_settings():
	# Применить настройки к игре
	# Пример:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume_value)
	DisplayServer.window_set_mode(fullscreen_mode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
