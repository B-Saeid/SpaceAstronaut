extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_node("Player")
onready var oxygenLabel = get_node("OxygenLabel")
var oxygenValue = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!player.isDead):
		check_oxygen(delta)
	

func check_oxygen(delta):
	oxygenValue -= delta
	oxygenLabel.text = "Oxygen " + str(int(oxygenValue))
	if oxygenValue < 1:
		player.Die()
