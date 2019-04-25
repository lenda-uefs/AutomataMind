extends Sprite

#TODO: mudar a imagem do automato no jogo

func _ready():
	
	pass

func check(senha):
	
	var cur_state = 1;
	
	for x in senha:
		match cur_state: 
			1: 
				if(x == 'b' or x == 'c'):
					cur_state = 1;
				elif(x == 'a'):
					cur_state = 2;
				else:
					return false;
			2:
				if(x == 'a' or x == 'b'):
					cur_state = 2;
				elif(x == 'c'):
					cur_state = 1;
				else: 
					return false;
	
	return (cur_state == 2)
	


