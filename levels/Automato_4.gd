extends Sprite


func _ready():
	
	pass

func check(senha): 

	var cur_state = 1
	
	for x in senha: 
		match cur_state: 
			1: 
				if(x == 'e' or x == 'f'):
					cur_state = 3
				elif(x == 's' or x == 'u'):
					cur_state = 2
				else: 
					return false
			2:
				if(x == 'e' or x == 'f' or x == 's'):
					cur_state = 1
				elif(x == 'u'):
					cur_state = 3
				else: 
					return false
			3: 
				if(x == 'e' or x == 'f' or x == 'u'):
					cur_state = 2
				elif(x == 's'):
					cur_state = 3
				else:
					return false
	
	return (cur_state == 3)