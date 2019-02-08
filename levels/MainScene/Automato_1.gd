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
				if(x == '1' or x == '2'):
					cur_state = 1
				elif(x == '3'):
					cur_state = 2
				else: 
					return false
			2:
				if(x == '1'):
					cur_state = 2
				elif(x == '2'):
					cur_state = 1
				else: 
					return false
	
	return (cur_state == 2)