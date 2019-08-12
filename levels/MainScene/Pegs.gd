extends Node


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func setup(pegs):
	
	var path 
	var d = 0 
	
	for c in pegs:
		if(c == "V"):
			path = "res://imgs/red_pin.PNG"
		else:
			path = "res://imgs/white_pin.PNG"
		
		get_node("peg" + str(d)).texture = load(path)
		get_node("peg" + str(d)).set_visible(true)
		d = d+1
