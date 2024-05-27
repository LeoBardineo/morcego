extends CharacterBody2D

const UP = Vector2(0, -1)
const FLAP = 400
const MAXFALLSPEED = 320
const GRAVITY = 26
const START_LIST = [1.0, 2.0, 3.7, 5.0, 6.4, 7.3, 8.0, 9.7, 11.0, 12.0, 13.0]

var motion = Vector2()
var score = 0

@onready var dmg_sound = $"../../DamageSound"
@onready var world = $"../.."
@onready var score_txt = $"../../CanvasLayer/RichTextLabel".text
@onready var game_over = $"../../GameOver"

func _ready():
	$Timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	$AnimatedSprite2D.play()
	#score_txt.text = world.loadValue("Scores", "high_score")

func _physics_process(_delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("FLAP"):
		$AudioStreamPlayer2D.play(START_LIST[randi() % START_LIST.size()])
		$Timer.set_wait_time(1)
		$Timer.start()
		motion.y = -FLAP
	
	set_velocity(motion)
	set_up_direction(UP)
	move_and_slide()
	motion = velocity

func _on_Resetter_body_entered(body):
	if body.name == "Walls":
		body.queue_free()

func _on_Detect_area_entered(area):
	if area.name == "PointerArea":
		score += 1
		get_parent().get_parent().get_node("CanvasLayer/RichTextLabel").text = "[center]Pontuação: " + str(score) + "[/center]"

func _on_Detect_body_entered(body):
	if body.name == "Walls":
		#score_txt.text = world.saveValue("Scores", "high_score")
		dmg_sound.play()
		get_tree().paused = true
		game_over.show()
			#get_tree().call_deferred("reload_current_scene")
