extends Node2D
var Wall = preload("res://scenes/WallNode.tscn")
var wallsLeft = 5

func _ready():
	pass

func _process(delta):
	pass

func Wall_spawn():
	var Wall_instance = Wall.instantiate()
	Wall_instance.position = Vector2(self.position.x, randf_range(-60, 60))
	get_parent().call_deferred("add_child", Wall_instance)
	wallsLeft -= 1

func _on_timer_timeout():
	if(wallsLeft):
		Wall_spawn()
	pass # Replace with function body.
