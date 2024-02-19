extends Camera2D

# Игровой объект, за которым следует камера
@export var target : Node2D
# Скорость перемещения камеры
@export var smoothing_speed : float = 5.0
# Минимальное и максимальное расстояние между камерой и игроком
@export var min_distance : float = 50
@export var max_distance : float = 200
# Ссылка на коллизию, которую камера должна учитывать
@export var collision : Area2D

func _ready():
	pass

func _process(delta):
	if not target:
		return

	# Получаем новую позицию для камеры
	var target_position = target.global_position

	# Ограничиваем расстояние между камерой и игроком
	var direction = target_position - global_position
	var distance = direction.length()
	if distance > max_distance:
		direction = direction.normalized() * max_distance
		target_position = global_position + direction
	elif distance < min_distance:
		direction = direction.normalized() * min_distance
		target_position = global_position + direction

	# Проверяем коллизии
	var collision_objects = collision.get_overlapping_areas()
	if collision_objects.size() > 0:
		var closest_collision = null
		var min_distance_squared = INF
		for obj in collision_objects:
			var collision_position = obj.global_position
			var distance_squared = global_position.distance_squared_to(collision_position)
			if distance_squared < min_distance_squared:
				min_distance_squared = distance_squared
				closest_collision = collision_position
		target_position = closest_collision

	# Сглаживаем движение камеры
	global_position = global_position.lerp(target_position, smoothing_speed * delta)

