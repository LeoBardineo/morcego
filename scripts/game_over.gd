extends Node2D

@onready var score = $"../CanvasLayer/RichTextLabel"
@onready var show_score = $VBoxContainer/Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	show_score.text = score.text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$".".hide()
	get_tree().paused = false
	get_tree().call_deferred("reload_current_scene")
