extends Sprite


func _ready():
	
	pass

func check(senha): 
	
	var cur_state = 1
	
	for x in senha: 
		match cur_state: 
			1: 
				if(x == '0' or x == '2' or x == '3'):
					cur_state = 1
				elif(x == 'a' or x == 'b'):
					cur_state = 2
				else: 
					return false
			2:
				if(x == '0' or x == '2' or x == '3'):
					cur_state = 2
				elif(x == 'c' or x == 'd'):
					cur_state = 3
				else: 
					return false
			3: 
				if(x == '0' or x == '2' or x == '3'):
					cur_state = 3
				elif(x == 'a' or x == 'c'):
					cur_state = 4
				else:
					return false
			4:
					return false
	
	return (cur_state == 4)