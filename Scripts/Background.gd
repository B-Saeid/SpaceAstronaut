extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# -- # Jumpy Version
# -- var sets = []
# -- export var speed = 150;
# -- var limit = -756
# -- var startPosition = 0
# -- var randomNumberGenerator = RandomNumberGenerator.new()
# -- var randomIndex = 0
# -- # Called when the node enters the scene tree for the first time.
# -- func _ready():
# -- 	for child in get_children():
# -- 		if child.is_in_group("Sets"):
# -- 			sets.append(child)
# -- 			remove_child(child)
# -- 	selectRandomSet()
# -- 
# -- func selectRandomSet():
# -- 	randomNumberGenerator.randomize()
# -- 	randomIndex = randomNumberGenerator.randi_range(0, sets.size() - 1)
# -- 	add_child(sets[randomIndex])
# -- 	
# -- 
# -- # Called every frame. 'delta' is the elapsed time since the previous frame.
# -- func _process(delta):
# -- 	translate(Vector2(-speed * delta,0))
# -- 	if position.x <= limit:
# -- 		position.x = startPosition
# -- 		remove_child(sets[randomIndex])
# -- 		selectRandomSet()


# ------------------------------------------------------
# My Version - No jumps
var sets = []
export var speed = 150;
var setWidth =  1775.0;
var setsPassed = 0;
var array = [0,2,1,2,0,2,0,1,2,0,1,2]

var onScreenSet
var offScreenSet

#var randomIndex

# Not Working, RandomNumberGenerator caused me a LOT of headaches
#func setRandomNumber():
	#var generator = RandomNumberGenerator.new()
	#generator.randomize()
	#randomIndex = generator.randi_range(0, sets.size() - 1)
	
func _ready():
	# Initializing sets and Removing Every Child
	for child in get_children():
		if child.is_in_group("Sets"):
			sets.append(child)
			remove_child(child)
	
	#setRandomNumber()
	#onScreenSet = sets[randomIndex]
	onScreenSet = sets[array[setsPassed]]
	add_child(onScreenSet)
	
	
	#setRandomNumber()
	#offScreenSet = sets[randomIndex]
	offScreenSet = sets[array[setsPassed + 1]]
	offScreenSet.position.x = setWidth
	add_child(offScreenSet)
	
	# onScreenSet.get_node("Alien").reset() # When we add aliens
	# offScreenSet.get_node("Alien").reset() # When we add aliens
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(-speed * delta,0))
	
	var remainder = floor(-position.x / setWidth)
	if(remainder > setsPassed):
		setsPassed += 1
		removePassedSetAndGenerateANewOne()
		
		
func removePassedSetAndGenerateANewOne():
	remove_child(onScreenSet)
	onScreenSet = offScreenSet
	
	#setRandomNumber()
	#offScreenSet = sets[randomIndex]
	offScreenSet = sets[array[setsPassed + 1]]
	# offScreenSet.get_node("Alien").reset() # When we add aliens
	offScreenSet.position.x = -position.x + setWidth
	add_child(offScreenSet)
	
