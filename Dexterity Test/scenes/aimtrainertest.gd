extends Node

var targets: int = 30
var try: float = 0 # each individual try to be added together
var total: float = 0 # sum of all tries^
var ave: float = 0 # average of all tries (total/ 30)
var start: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$EndTitle.visible = false
	$Target.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if targets < 1:
		end()
		
	if start == true:
		$Remaining.text = "Remaining: " + str(targets)


func _on_start_button_pressed():
	start = true
	$StartButton.queue_free()
	$BackButton.visible = false
	$BackButton.disabled = true
	$Title.visible = false
	$SubTitle.visible = false
	$Remaining.text = "Remaining: " + str(targets)
	draw_button()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/aimtrainer.tscn")


func draw_button():
	$TryTimer.start()
	$Target.visible = true
	$Target.position.x = randf_range(($Target.size.x / 2), (get_window().size.x-$Target.size.x))
	$Target.position.y = randf_range(($Target.size.y / 2), (get_window().size.y-$Target.size.y))
	print(str($Target.position.x))
	print(str($Target.position.y))


func _on_target_pressed():
	try = int((4096-$TryTimer.time_left)*1000)
	total += try
	targets -= 1
	draw_button()


func end():
	start = false
	
	$Target.visible = false
	$Target.disabled = true
	
	ave = int(total/30)
	$SubTitle.visible = true
	$SubTitle.text = "Average: " + str(ave) + " ms"
	
	$BackButton.visible = true
	$BackButton.disabled = false
	
	$Remaining.visible = false
	
	$EndTitle.visible = true
	
	Global.aim_trainer_test_score(ave)
	Global.save()
