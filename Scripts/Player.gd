extends RigidBody2D


onready var animation = get_node("AnimatedSprite")
onready var background = get_parent().get_node("Background")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Run")
	print("Ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_body_entered(body):
	print("Entered")
	print(body.get_parent().is_in_group("Obstacles"))
	if body.get_parent().is_in_group("Obstacles"): 
		Die()


func Die():
	animation.play("Death")
	background.speed = 0
	# get_tree().quit()
