extends Node2D
#
#@onready var high_score_label = $CanvasLayer/HighScoreLabel
#
#
#var save_file_path= "user://save/"
#var save_file_name= "PlayerSave.tres"
#
#var playerData = PlayerData.new()
#
#func _ready():
	#verify_save_directory(save_file_path)
	#
#
#func verify_save_directory(path: String):
	#DirAccess.make_dir_absolute(path)
#
#func update_label():
	#high_score_label.text = "Melhor pontuação: " + str(playerData.high_score) 
#
#func load_data():
	#playerData = ResourceLoader.load(save_file_path + save_file_name).duplicate(true)
	#
#func save_data():
	#ResourceSaver.save(playerData, save_file_path + save_file_name)
#
#func update_high_score():
	#playerData.change_high_score(score)
