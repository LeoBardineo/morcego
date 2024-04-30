extends Node2D

var high_score = player.score

var save_path = "res://save-file.cfg"
var config = ConfigFile.new()
var load_response = config.load(save_path)

@onready var player = $PlayerNode/Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func saveValue(section,key):
	config.set_value(section, key, high_score)
	config.save(save_path)

func loadValue(section, key):
	high_score = config.get_value(section,key, high_score)
