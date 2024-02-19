extends AudioStreamPlayer2D

@export var Music : AudioStreamPlayer2D
var ScreamPlayed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Music.get_playback_position() >= 5 and !ScreamPlayed):
		stream = preload("res://src/Voices/gamejamschhhhh.wav")
		play()
		ScreamPlayed = true
		
	if (Music.get_playback_position() < 1):
		ScreamPlayed = false
	pass
