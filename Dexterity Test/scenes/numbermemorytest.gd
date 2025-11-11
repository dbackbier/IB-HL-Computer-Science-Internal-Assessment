extends Node

var start: bool = false
var take_input: bool = false
var level: int = 1
var num: int
var num_list: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Countdown.visible = false


	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start == true:
		$LevelLabel.text = "Level: " + str(level)
		if take_input == true:
			input()
		if take_input == false:
			$Countdown.value = $Timer.time_left
			


func _on_start_button_pressed():
	start = true
	
	$StartButton.queue_free()
	$BackButton.disabled = true
	
	$LevelLabel.text = "Level: " + str(level)
	
	generate_num()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/number_memory.tscn")


func generate_num():
	take_input = false
	$InputLabel.text = ""
	num = randi_range(pow(10, (level-1)), pow(10, level) - 1)
	$NumberLabel.text = str(num)
	$Timer.start()
	$Countdown.visible = true
	$Countdown.value = $Timer.time_left


func _on_timer_timeout():
	$InputLabel.text = "Number: "
	take_input = true


func input():
	$NumberLabel.text = ""
	$Countdown.visible = false
	
	if Input.is_action_just_pressed("0"):
		num_list.append(0)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("1"):
		num_list.append(1)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("2"):
		num_list.append(2)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("3"):
		num_list.append(3)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("4"):
		num_list.append(4)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("5"):
		num_list.append(5)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("6"):
		num_list.append(6)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("7"):
		num_list.append(7)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("8"):
		num_list.append(8)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("9"):
		num_list.append(9)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("backspace"):
		num_list.remove_at(num_list.size() - 1)
		$InputLabel.text = "Number: " + array_to_string(num_list)
	if Input.is_action_just_pressed("enter"):
		answer()


func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i)
	return s


func answer():
	if array_to_string(num_list) == str(num):
		level += 1
		num_list.clear()
		generate_num()
	else:
		end()


func end():
	start = false
	$LevelLabel.text = "Congradulations you made it to level " + str(level)
	$InputLabel.text = ""
	$NumberLabel.text = "Answer: " + str(num)
	$BackButton.disabled = false
	Global.number_memory_test_score(level)
	Global.save()
