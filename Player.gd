extends CharacterBody2D

# Скорость перемещения игрока
@export var SPEED = 200
# Фактор замедления при остановке (меньше - больше замедление)
@export var DECELERATION_FACTOR = 0.1
# Скорость отскока после остановки
@export var BOUNCE_SPEED = 100
# Фактор замедления отскока (меньше - больше замедление)
@export var BOUNCE_DECELERATION_FACTOR = 0.1

@export var Sprite : AnimatedSprite2D

var SpriteWidth

func _ready():
	Sprite.play("default")
	SpriteWidth = Sprite.scale.x
	pass # Replace with function body.

func _physics_process(delta):
	# Получаем ввод от клавиатуры
	var input_vector = Vector2()

	# Проверяем нажатые клавиши и формируем вектор движения
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
		
	# Зеркалируем спрайт в зависимости от направления движения
	if input_vector.x < 0:
		Sprite.scale.x = -SpriteWidth  # Зеркалируем по оси X
	elif input_vector.x > 0:
		Sprite.scale.x = SpriteWidth   # Возвращаем исходный масштаб по оси X

	# Нормализуем вектор движения, чтобы игрок не двигался быстрее по диагонали
	input_vector = input_vector.normalized()

	# Обновляем скорость в соответствии с вводом
	if input_vector != Vector2.ZERO:
		velocity = input_vector * SPEED
	else:
		# Если ничего не нажато, замедляем скорость
		velocity = velocity.lerp(Vector2.ZERO, DECELERATION_FACTOR)

	# Перемещаем игрока
	move_and_slide()

func _process(delta):
	# Применяем эффект отскока, если игрок остановился
	if velocity == Vector2.ZERO and get_slide_collision_count() == 0:
		velocity = velocity.bounce(get_floor_normal()) * BOUNCE_SPEED * delta
		velocity = velocity.lerp(Vector2.ZERO, BOUNCE_DECELERATION_FACTOR)

