extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var array = Array()
# var array = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	
	array.append("Text One")
	array.append("Text Two")
	print(array)
	array[0] = "Text One Changed"
	print(array)
	
	print('----------------');
	
	for item in array:
		print(item);
	
	print('----------------');
	
	for index in range(array.size()):
		print(index);
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
