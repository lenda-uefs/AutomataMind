extends Label


var sequencias = [["bbbaba", "aaabbb", "babbba", "aaaaab"], ["teste", "teste", "teste"], ["x", "x"]]
var rand

export var seq_atual = ""

func _ready():
	
	
	randomize()
	rand = randi() % 3 # retorna número aleatória entre 0 e 1. Pega o índice do vetor dentro da matriz. Vai mudar depois que aumentar o número de vetores. 
	
	seq_atual = sequencias[rand]
	
	rand = randi() % 2 # retorna entre 0 e 1. Pega o índice de uma palavra dentro do vetor
	
	seq_atual = seq_atual[rand]
	
	self.set_text(seq_atual)
	
	
	pass
	

func _change_label(label):
	seq_atual = label
	self.set_text(seq_atual)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
