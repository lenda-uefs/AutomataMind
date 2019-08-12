extends Sprite


func _ready():
	
	pass

func check(senha): 

	var cur_state = 1
	
	for x in senha: 
		match cur_state: 
			1: 
				if(x == '0' or x == '1'):
					cur_state = 1
				elif(x == 'a' or x == 'b'):
					cur_state = 2
				else: 
					return false
			2:
				if(x == '0' or x == '1' or x == 'a'):
					cur_state = 1
				elif(x == 'b'):
					cur_state = 3
				else: 
					return false
			3: 
				if(x == 'a' or x == 'b'):
					cur_state = 3
				elif(x == '0' or x == '1'):
					cur_state = 4
				else:
					return false
			4:
				if(x == 'a' or x == 'b'): 
					cur_state = 3
				elif(x == '0' or x == '1'):
					cur_state = 4
				else: 
					return false
	

	return (cur_state == 4)