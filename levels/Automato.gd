extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func automato_0(senha):
	
	var cur_state = 1;
	
	for x in senha:
		match cur_state: 
			1: 
				if(x == 'b'):
					cur_state = 1;
				elif(x == 'a'):
					cur_state = 2;
				else:
					return false;
			2:
				if(x == 'a' or x == 'b'):
					cur_state = 2;
	
	if(cur_state == 2):
		return true;
	else: 
		return false;
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass