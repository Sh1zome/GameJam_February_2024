extends Area2D

@export var panel : Panel
@export var message_window : TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", Callable(self, "_on_player_entered"))
	connect("body_exited", Callable(self, "_on_player_exited"))
	pass # Replace with function body.


func _on_player_entered(body):
	# Показываем окно с текстом
	if !message_window.visible:
		panel.visible = true
		

# Обработчик выхода игрока из области
func _on_player_exited(body):
	panel.visible = false
	# Скрываем окно с текстом
	if message_window.visible:
		message_window.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("action") and panel.visible:
		message_window.visible = true
		panel.visible = false
	pass
