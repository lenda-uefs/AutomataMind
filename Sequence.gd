extends Label


var sequencias = [["bbbaba", "aaabbb", "babbba", "aaaaab"], ["bcabcc", "cbbabb", "ababac", "cbbcab"]] #, ["testes", "testes", "testes"], ["xxxxxx", "xxxxxx"]]
var rand
var lvl_index = 0

export var seq_atual = ""

func _ready():
	
	_get_cur_sequence()
	
	pass
	

func _get_cur_sequence():
	
	randomize()
	
	seq_atual = sequencias[lvl_index]
	
	rand = randi() % 4 # retorna um número entre 0 e (n-1). Pega o índice de uma palavra dentro do vetor
	
	seq_atual = seq_atual[rand]
	
	self.set_text(seq_atual)
	
	print(seq_atual)
	

func _get_next_seq():
	lvl_index = lvl_index + 1
	_get_cur_sequence()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
