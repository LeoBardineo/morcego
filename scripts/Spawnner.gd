extends Node2D
var Wall = preload("res://scenes/WallNode.tscn")
var wallsLeft = 5

func _ready():
	pass

func _process(delta):
	pass

# Spawna uma parede na posição do node Spawnner com y randomizado de 60 à -60
func Wall_spawn():
	var Wall_instance = Wall.instantiate()
	Wall_instance.position = Vector2(self.position.x, randf_range(-60, 60))
	get_parent().call_deferred("add_child", Wall_instance)
	wallsLeft -= 1

# Spawna uma quantidade de wallsLeft paredes de acordo com o Timer filho do node Spawnner
func _on_timer_timeout():
	if(wallsLeft):
		Wall_spawn()
	pass
