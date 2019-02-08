extends Label


var sequencias = [["aaab", "bcaa", "cbab", "babb"], ["1223", "2323", "2231", "3231"]] 
var rand
onready var lvl_index = get_node("/root/global").cur_lvl

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
	
	print(seq_atual) # TODO: apagar isso
	


