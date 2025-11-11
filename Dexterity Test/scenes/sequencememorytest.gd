extends Node

var sequence: Array = []
var pressed: Array = []
var level: int = 1
var lives: int = 3
var light_up = false # whether or not a button will light up
var done_light_up = false # whether or not the sequence is done, false = no, true = yes and user can begin pressing buttons
var start = false # whether or not the test has started
var user_turn = false # state whether or not it's the user's turn

# Called when the node enters the scene tree for the first time.
func _ready():
	$Buttons/Button1.disabled = true
	$Buttons/Button2.disabled = true
	$Buttons/Button3.disabled = true
	$Buttons/Button4.disabled = true
	$Buttons/Button5.disabled = true
	$Buttons/Button6.disabled = true
	$Buttons/Button7.disabled = true
	$Buttons/Button8.disabled = true
	$Buttons/Button9.disabled = true
	sequence.append(randi_range(1, 9))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$LivesTitle.text = "Lives: " + str(lives)
	$SubTitle.text = "Level: " + str(level)
	
	if lives <= 0:
		end(level)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/sequencememory.tscn")


func _on_button_1_pressed(): # top left
	if sequence[0] != 1:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()

func _on_button_2_pressed(): # top mid
	if sequence[0] != 2:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()

func _on_button_3_pressed(): # top right
	if sequence[0] != 3:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()

func _on_button_4_pressed(): # mid left
	if sequence[0] != 4:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()

func _on_button_5_pressed(): # mid
	if sequence[0] != 5:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()

func _on_button_6_pressed(): # mid right
	if sequence[0] != 6:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()

func _on_button_7_pressed(): # bottom left
	if sequence[0] != 7:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()


func _on_button_8_pressed(): # bottom mid
	if sequence[0] != 8:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()


func _on_button_9_pressed(): # bottom right
	if sequence[0] != 9:
		lives -= 1
	else:
		pressed.append(sequence[0])
		sequence.remove_at(0)
	if sequence.size() == 0:
		user_turn = false
		new_level()


func light_up_button(i): # call everytime a button needs to light up
	done_light_up = false
	var style = StyleBoxFlat.new()
	style.bg_color = Color.FIREBRICK
	$LightUpTimer.one_shot = true
	$LightUpTimer.start()
	if i == 1:
		$Buttons/Button1.add_theme_stylebox_override("normal", style)
		$Buttons/Button1.add_theme_stylebox_override("hover", style)
		$Buttons/Button1.add_theme_stylebox_override("pressed", style)
		$Buttons/Button1.add_theme_stylebox_override("disabled", style)
	elif i == 2:
		$Buttons/Button2.add_theme_stylebox_override("normal", style)
		$Buttons/Button2.add_theme_stylebox_override("hover", style)
		$Buttons/Button2.add_theme_stylebox_override("pressed", style)
		$Buttons/Button2.add_theme_stylebox_override("disabled", style)
	elif i == 3:
		$Buttons/Button3.add_theme_stylebox_override("normal", style)
		$Buttons/Button3.add_theme_stylebox_override("hover", style)
		$Buttons/Button3.add_theme_stylebox_override("pressed", style)
		$Buttons/Button3.add_theme_stylebox_override("disabled", style)
	elif i == 4:
		$Buttons/Button4.add_theme_stylebox_override("normal", style)
		$Buttons/Button4.add_theme_stylebox_override("hover", style)
		$Buttons/Button4.add_theme_stylebox_override("pressed", style)
		$Buttons/Button4.add_theme_stylebox_override("disabled", style)
	elif i == 5:
		$Buttons/Button5.add_theme_stylebox_override("normal", style)
		$Buttons/Button5.add_theme_stylebox_override("hover", style)
		$Buttons/Button5.add_theme_stylebox_override("pressed", style)
		$Buttons/Button5.add_theme_stylebox_override("disabled", style)
	elif i == 6:
		$Buttons/Button6.add_theme_stylebox_override("normal", style)
		$Buttons/Button6.add_theme_stylebox_override("hover", style)
		$Buttons/Button6.add_theme_stylebox_override("pressed", style)
		$Buttons/Button6.add_theme_stylebox_override("disabled", style)
	elif i == 7:
		$Buttons/Button7.add_theme_stylebox_override("normal", style)
		$Buttons/Button7.add_theme_stylebox_override("hover", style)
		$Buttons/Button7.add_theme_stylebox_override("pressed", style)
		$Buttons/Button7.add_theme_stylebox_override("disabled", style)
	elif i == 8:
		$Buttons/Button8.add_theme_stylebox_override("normal", style)
		$Buttons/Button8.add_theme_stylebox_override("hover", style)
		$Buttons/Button8.add_theme_stylebox_override("pressed", style)
		$Buttons/Button8.add_theme_stylebox_override("disabled", style)
	elif i == 9:
		$Buttons/Button9.add_theme_stylebox_override("normal", style)
		$Buttons/Button9.add_theme_stylebox_override("hover", style)
		$Buttons/Button9.add_theme_stylebox_override("pressed", style)
		$Buttons/Button9.add_theme_stylebox_override("disabled", style)
		


func turn_off_button(i):
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 0.84, 0)
	if i == 1:
		$Buttons/Button1.add_theme_stylebox_override("normal", style)
		$Buttons/Button1.add_theme_stylebox_override("hover", style)
		$Buttons/Button1.add_theme_stylebox_override("pressed", style)
		$Buttons/Button1.add_theme_stylebox_override("disabled", style)
	elif i == 2:
		$Buttons/Button2.add_theme_stylebox_override("normal", style)
		$Buttons/Button2.add_theme_stylebox_override("hover", style)
		$Buttons/Button2.add_theme_stylebox_override("pressed", style)
		$Buttons/Button2.add_theme_stylebox_override("disabled", style)
	elif i == 3:
		$Buttons/Button3.add_theme_stylebox_override("normal", style)
		$Buttons/Button3.add_theme_stylebox_override("hover", style)
		$Buttons/Button3.add_theme_stylebox_override("pressed", style)
		$Buttons/Button3.add_theme_stylebox_override("disabled", style)
	elif i == 4:
		$Buttons/Button4.add_theme_stylebox_override("normal", style)
		$Buttons/Button4.add_theme_stylebox_override("hover", style)
		$Buttons/Button4.add_theme_stylebox_override("pressed", style)
		$Buttons/Button4.add_theme_stylebox_override("disabled", style)
	elif i == 5:
		$Buttons/Button5.add_theme_stylebox_override("normal", style)
		$Buttons/Button5.add_theme_stylebox_override("hover", style)
		$Buttons/Button5.add_theme_stylebox_override("pressed", style)
		$Buttons/Button5.add_theme_stylebox_override("disabled", style)
	elif i == 6:
		$Buttons/Button6.add_theme_stylebox_override("normal", style)
		$Buttons/Button6.add_theme_stylebox_override("hover", style)
		$Buttons/Button6.add_theme_stylebox_override("pressed", style)
		$Buttons/Button6.add_theme_stylebox_override("disabled", style)
	elif i == 7:
		$Buttons/Button7.add_theme_stylebox_override("normal", style)
		$Buttons/Button7.add_theme_stylebox_override("hover", style)
		$Buttons/Button7.add_theme_stylebox_override("pressed", style)
		$Buttons/Button7.add_theme_stylebox_override("disabled", style)
	elif i == 8:
		$Buttons/Button8.add_theme_stylebox_override("normal", style)
		$Buttons/Button8.add_theme_stylebox_override("hover", style)
		$Buttons/Button8.add_theme_stylebox_override("pressed", style)
		$Buttons/Button8.add_theme_stylebox_override("disabled", style)
	elif i == 9:
		$Buttons/Button9.add_theme_stylebox_override("normal", style)
		$Buttons/Button9.add_theme_stylebox_override("hover", style)
		$Buttons/Button9.add_theme_stylebox_override("pressed", style)
		$Buttons/Button9.add_theme_stylebox_override("disabled", style)
		
	$InBetweenTimer.one_shot = true
	$InBetweenTimer.start()


func _on_start_button_pressed():
	$Buttons/StartButton.queue_free()
	$Buttons/BackButton2.disabled = true
	$SubTitle.text = "Level: " + str(level)
	play()


func _on_light_up_timer_timeout():
	done_light_up = true


func new_level():
	level += 1
	$Buttons/Button1.disabled = true
	$Buttons/Button2.disabled = true
	$Buttons/Button3.disabled = true
	$Buttons/Button4.disabled = true
	$Buttons/Button5.disabled = true
	$Buttons/Button6.disabled = true
	$Buttons/Button7.disabled = true
	$Buttons/Button8.disabled = true
	$Buttons/Button9.disabled = true
	for index in pressed.size():
		sequence.append(pressed[index])
	sequence.append(randi_range(1, 9))
	pressed.clear()
	play()


func play():
	start = true
	light_up = true
	for index in sequence.size():
		light_up_button(sequence[index])
		await $LightUpTimer.timeout
		turn_off_button(sequence[index])
		await $InBetweenTimer.timeout
	$Buttons/Button1.disabled = false
	$Buttons/Button2.disabled = false
	$Buttons/Button3.disabled = false
	$Buttons/Button4.disabled = false
	$Buttons/Button5.disabled = false
	$Buttons/Button6.disabled = false
	$Buttons/Button7.disabled = false
	$Buttons/Button8.disabled = false
	$Buttons/Button9.disabled = false
	user_turn = true


func end(le):
	$Buttons/BackButton2.disabled = false
	$SubTitle.text = "Congradulations! You survived until level " + str(le)
	$LivesTitle.text = "Go back and come back in to try again!"
	Global.sequence_memory_test_score(le)
	Global.save()
