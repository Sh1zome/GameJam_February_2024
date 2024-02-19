extends AnimatedSprite2D

var t = 0.0
var direction = 1
@export var Audio : AudioStreamPlayer2D
var BulbFlickSound = preload("res://src/Sounds/BulbFlick.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.y = 1.08
	play("default")
	Audio.stream = BulbFlickSound
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if frame == 20 and !Audio.is_playing():
		Audio.play()
	t += delta

	if global_rotation <= -0.03:
		direction = 1
	elif global_rotation >= 0.03:
		direction = -1
		

	rotation = lerp_angle(rotation, 0.2 * direction, 0.001)
#
	#global_rotation_degrees = -1 * direction * t
	#transform = Transform2D(0.0, position).interpolate_with(Transform2D(0.001 * direction, position), t * 100)

