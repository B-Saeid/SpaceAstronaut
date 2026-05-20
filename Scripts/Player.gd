extends RigidBody2D


onready var animation = get_node("AnimatedSprite")
onready var background = get_parent().get_node("Background")
export var jumpForce = 220;
var isJumping = false;
var isDead = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Run")
	print("Ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_body_entered(body):
	if(isDead):
		pass
	elif(body.get_parent().is_in_group("Ground")):
		animation.play("Run")
		isJumping = false
	elif body.get_parent().is_in_group("Obstacles"): 
		Die()

func _physics_process(delta):
	Jump()
	Crouch()

func Jump():
	if Input.is_action_pressed("Jump") && !isJumping && !isDead:
		set_axis_velocity(Vector2(0, -jumpForce))
		animation.play("Jump")
		isJumping = true

func Crouch():
	if Input.is_action_pressed("Crouch") && !isDead:
		animation.play("Crouch")
		get_node("CollisionShape2D").scale.y = 0.7
	if Input.is_action_just_released("Crouch") && !isJumping && !isDead:
		animation.play("Run")
		get_node("CollisionShape2D").scale.y = 1.0

func Die():
	isDead = true
	animation.play("Death")
	background.speed = 0
	# get_tree().quit()
