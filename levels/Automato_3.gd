extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	pass

func check(senha): 

	var cur_state = 1
	
	for x in senha: 
		match cur_state: 
			1: 
				if(x == 'a' or x == 'c'):
					cur_state = 1
				elif(x == 'b'):
					cur_state = 2
				else: 
					return false
			2:
				if(x == 'a' or x == 'c'):
					cur_state = 2
				elif(x == 'b'):
					cur_state = 3
				else: 
					return false
			3: 
				if(x == 'a' or x == 'c'):
					cur_state = 2
				elif(x == 'b'):
					cur_state = 3
				else:
					return false
	
	return (cur_state == 3)