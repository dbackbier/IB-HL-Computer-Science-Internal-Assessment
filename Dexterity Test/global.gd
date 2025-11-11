extends Node

var reaction_time = 10000000000000
var sequence_memory = 0
var aim_trainer = 10000000000000
var number_memory = 0
var verbal_memory = 0

var save_path = "user://ia_data.save"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reaction_time_test_score(i):
	if i < reaction_time:
		reaction_time = i


func sequence_memory_test_score(i):
	if i > sequence_memory:
		sequence_memory = i


func aim_trainer_test_score(i):
	if i < aim_trainer:
		aim_trainer = i


func verbal_memory_test_score(i):
	if i > verbal_memory:
		verbal_memory = i


func number_memory_test_score(i):
	if i > number_memory:
		number_memory = i


func save():
	save_path = "user://ia_data.save"
	var file = FileAccess.open(Global.save_path, FileAccess.WRITE)
	file.store_var(Global.reaction_time)
	file.store_var(Global.aim_trainer)
	file.store_var(Global.sequence_memory)
	file.store_var(Global.verbal_memory)
	file.store_var(Global.number_memory)
