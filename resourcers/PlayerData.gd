extends Resource
class_name PlayerData

@export var high_score = 0

func change_high_score(value : int):
	if value >= high_score:
		high_score = value
