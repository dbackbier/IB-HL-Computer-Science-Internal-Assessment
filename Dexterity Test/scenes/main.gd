extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.save_path = "user://ia_data.save"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_games_button_pressed():
	get_tree().change_scene_to_file("res://scenes/exercises.tscn")


func _on_dashboard_button_pressed():
	get_tree().change_scene_to_file("res://scenes/dashboard.tscn")


func _on_quit_button_pressed():
	save()
	get_tree().quit()


func save():
	Global.save_path = "user://ia_data.save"
	var file = FileAccess.open(Global.save_path, FileAccess.WRITE)
	file.store_var(Global.reaction_time)
	file.store_var(Global.aim_trainer)
	file.store_var(Global.sequence_memory)
	file.store_var(Global.verbal_memory)
	file.store_var(Global.number_memory)


func _on_save_button_pressed():
	save()


func _on_exercises_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/exercises.tscn")
