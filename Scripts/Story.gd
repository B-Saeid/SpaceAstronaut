extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var storyText = get_node("ColorRect/StoryText")
onready var startButton = get_node("ColorRect/StartButton")

# Called when the node enters the scene tree for the first time.
func _ready():
	storyText.percent_visible = 0
	startButton.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(storyText.percent_visible < 1):
		storyText.percent_visible += delta
	else:
		startButton.visible = true


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/MainGame.tscn")
