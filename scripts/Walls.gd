extends StaticBody2D

var wallVelocity = -2

func _ready():
	pass # Replace with function body.

# Move a parede para a esquerda a cada frame
func _physics_process(_delta):
	position += Vector2(wallVelocity, 0)
