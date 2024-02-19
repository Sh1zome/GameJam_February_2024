extends AnimatedSprite2D

var direction = 1
var pos_y

# Called when the node enters the scene tree for the first time.
func _ready():
	pos_y = get_global_position().y
	play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_global_position().y <= pos_y - 8:
		direction = 1
	elif get_global_position().y >= pos_y + 8: 
		direction = -1
	set_global_position(get_global_position().lerp(Vector2(get_global_position().x, (pos_y + (10 * direction))), 0.04))
	pass
