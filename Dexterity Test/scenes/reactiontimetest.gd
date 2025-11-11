extends Node

var start: bool = false # react timer started
var react: bool = false # try timer started
var tries: int = 5 # amount of tries user gets
var try: float = 0 # each individual try to be added to times
var times: Array = [] # array of all times to find average
var total: float = 0 # total of all the times from array times
var ave: float = 0 # average of all the times from array times

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start == false and tries > 0:
		if Input.is_action_pressed("start"):
			reaction()
	if tries == 0:
		end()

func reaction():
	$BackButton.disabled = true
	$ReactButton.text = ""
	$ReactTimer.wait_time = randf_range(3.0, 10.0)
	start = true
	$ReactTimer.start()


func _on_react_button_button_down():
	if start == true:
		if react == true:
			try = int((4096-$TryTimer.time_left)*1000)
			$ReactButton.text = str(try) + " ms"
			times.append(try)
			tries -= 1
			$ReactTimer.stop()
			$InBetweenTimer.start()
			react = false
		elif react == false:
			$ReactButton.text = "Too Soon!"
			$ReactTimer.stop()
			$InBetweenTimer.start()


func _on_react_timer_timeout():
	$TryTimer.start()
	react = true
	$ReactButton.get_theme_stylebox("hover").bg_color = Color.CRIMSON
	$ReactButton.get_theme_stylebox("normal").bg_color = Color.CRIMSON


func restart():
	$ReactButton.text = "Press Space to Start"
	$ReactButton.get_theme_stylebox("hover").bg_color = Color(1, 0.84, 0, 1)
	$ReactButton.get_theme_stylebox("normal").bg_color = Color(1, 0.84, 0, 1)
	start = false
	$InBetweenTimer.stop()


func end():
	ave = int((times[0]+times[1]+times[2]+times[3]+times[4])/ len(times))
	$ReactButton.text = "Average: " + str(ave) + " ms"
	Global.reaction_time_test_score(ave)
	Global.save()
	$BackButton.disabled = false


func _on_in_between_timer_timeout():
	restart()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/reactiontime.tscn")
