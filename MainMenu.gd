extends Node2D

var character1_button : TextureButton = null
var character2_button : TextureButton = null

func _ready():
	pass

func _on_play_pressed():
	# Скрыть главное меню и перейти к меню выбора персонажа
	$SettingsMenu.hide() # Убедитесь, что меню настроек скрыто
	$PlayButton.hide()
	$SettingsButton.hide()
	# Здесь добавьте код для перехода к меню выбора персонажа
	# Например:
	# Скрыть главное меню

	# Создать кнопки для выбора персонажа
	character1_button = TextureButton.new()
	character1_button.texture_normal = preload("res://src/MainMenu/GhostButton.png")
	character1_button.texture_hover = preload("res://src/MainMenu/GhostButtonHovered.png")
	character1_button.connect("pressed", Callable(self, "_on_character1_selected"))
	add_child(character1_button)
	character1_button.position = Vector2(586, 382)

	character2_button = TextureButton.new()
	character2_button.disabled = true
	character2_button.texture_normal = preload("res://src/MainMenu/Shadow.png")
	character2_button.texture_disabled = preload("res://src/MainMenu/Shadow.png")
	character2_button.connect("pressed", Callable(self, "_on_character2_selected"))
	add_child(character2_button)
	character2_button.position = Vector2(586, 514)

func _on_settings_pressed():
	# Показать или скрыть меню настроек
	$SettingsMenu.visible = not $SettingsMenu.visible

func _on_character1_selected():
	# Здесь загружаем сцену для персонажа 1
	var character_scene = preload("res://Level1.tscn").instantiate()
	get_node("/root/Main Menu").queue_free()
	
	get_tree().root.add_child(character_scene)

func _on_character2_selected():
	# Здесь загружаем сцену для персонажа 2
	var character_scene = preload("res://Controller.tscn")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		$SettingsMenu.visible = true # Убедитесь, что меню настроек скрыто
		$PlayButton.visible = true
		$SettingsButton.visible = true
		$SettingsMenu.visible = false
		if character1_button != null:
			character1_button.queue_free()
		if character2_button != null:
			character2_button.queue_free()
		
	pass
	


func _on_escape_pressed():
	$SettingsMenu.visible = false
	pass # Replace with function body.
