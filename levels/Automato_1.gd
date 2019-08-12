extends Sprite

func _ready():
	
	pass


func check(senha): 

	var cur_state = 1
	
	for x in senha: 
		match cur_state: 
			1: 
				if(x == '1'):
					cur_state = 1
				elif(x == '3' or x == '2'):
					cur_state = 2
				else: 
					return false
			2:
				if(x == '1'):
					cur_state = 2
				elif(x == '2' or x == '3'):
					cur_state = 1
				else: 
					return false
	
	return (cur_state == 2)