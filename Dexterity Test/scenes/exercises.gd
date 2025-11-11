extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_number_button_pressed():
	get_tree().change_scene_to_file("res://scenes/number_memory.tscn")


func _on_verbal_button_pressed():
	get_tree().change_scene_to_file("res://scenes/verbalmemory.tscn")


func _on_aim_button_pressed():
	get_tree().change_scene_to_file("res://scenes/aimtrainer.tscn")


func _on_sequence_button_pressed():
	get_tree().change_scene_to_file("res://scenes/sequencememory.tscn")


func _on_reaction_button_pressed():
	get_tree().change_scene_to_file("res://scenes/reactiontime.tscn")
