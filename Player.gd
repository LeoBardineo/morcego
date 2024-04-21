extends KinematicBody2D

const UP = Vector2(0, -1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10
const START_LIST = [1.0, 2.0, 3.7, 5.0, 6.4, 7.3, 8.0, 9.7, 11.0, 12.0, 13.0]

var motion = Vector2()

func _ready():
	$Timer.connect("timeout", self, "_on_timer_timeout")
	$AnimatedSprite.play()
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("FLAP"):
		$AudioStreamPlayer2D.play(START_LIST[randi() % START_LIST.size()])
		$Timer.set_wait_time(1)
		$Timer.start()
		motion.y = -FLAP
	
	motion = move_and_slide(motion, UP)

func _on_timer_timeout():
	print('aaaa')
	$AudioStreamPlayer2D.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
