extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.reaction_time >= 10000000000000:
		$Labels/ReactionTimeTestLabel.text = "N/A"
	else:
		$Labels/ReactionTimeTestLabel.text = str(Global.reaction_time) + " ms"
	if Global.sequence_memory <= 0:
		$Labels/SequenceMemoryTestLabel.text = "N/A"
	else:
		$Labels/SequenceMemoryTestLabel.text = str(Global.sequence_memory)
	if Global.aim_trainer >= 10000000000000:
		$Labels/AimTrainerLabel.text = "N/A"
	else:
		$Labels/AimTrainerLabel.text = str(Global.aim_trainer) + " ms"
	if Global.number_memory <= 0:
		$Labels/VisualMemoryLabel.text = "N/A"
	else:
		$Labels/VisualMemoryLabel.text = str(Global.number_memory)
	if Global.verbal_memory <= 0:
		$Labels/VerbalMemoryLabel.text = "N/A"
	else:
		$Labels/VerbalMemoryLabel.text = str(Global.verbal_memory)
	


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/reactiontime.tscn")


func _on_play_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/sequencememory.tscn")


func _on_play_button_3_pressed():
	get_tree().change_scene_to_file("res://scenes/aimtrainer.tscn")


func _on_play_button_4_pressed():
	get_tree().change_scene_to_file("res://scenes/number_memory.tscn")


func _on_play_button_5_pressed():
	get_tree().change_scene_to_file("res://scenes/verbalmemory.tscn")


func load_data():
		if FileAccess.file_exists(Global.save_path):
			var file = FileAccess.open(Global.save_path, FileAccess.READ)
			Global.reaction_time = file.get_var(Global.reaction_time)
			Global.aim_trainer = file.get_var(Global.aim_trainer)
			Global.sequence_memory = file.get_var(Global.sequence_memory)
			Global.verbal_memory = file.get_var(Global.verbal_memory)
			Global.number_memory = file.get_var(Global.number_memory)
		else: # No file exists
			Global.reaction_time = 10000000000000
			Global.aim_trainer = 10000000000000
			Global.sequence_memory = 0
			Global.verbal_memory = 0
			Global.number_memory = 0


func delete_data():
	Global.save_path = ""
	Global.reaction_time = 10000000000000
	Global.aim_trainer = 10000000000000
	Global.sequence_memory = 0
	Global.verbal_memory = 0
	Global.number_memory = 0


func _on_delete_button_pressed():
	delete_data()


func _on_load_button_pressed():
	load_data()


func _on_save_button_pressed():
	Global.save()
