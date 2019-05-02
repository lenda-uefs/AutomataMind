extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_update_points():
	var tries = get_node("/root/MainScene/").max_tentativas 
	var points = 0
	
	tries = 10-tries
	
	print(str(tries))
	
	if(tries >= 3):
		points = 1000 - ((tries*100) - 100)
	elif(tries == 2):
		points = 1000
	else:
		points = 0
	
	_animate_points(0, points)
	
	# get_node("Stars").value = points
	
	#if(points > 600):
	#	get_node("Label").set_visible(true)
	
func _animate_points(start, end):
	$Tween.interpolate_property($Stars, "value", start, end, 5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
	
	
