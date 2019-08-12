extends Label


var sequencias = [["aaab", "bcaa", "cbab", "baca"], ["1223", "2321", "1131", "3231"], ["1001", "1101", "0100", "0011"], ["cbab","baab", "bbab", "acbb"], ["eseu", "sufu", "fsuu", "ssuu"], ["eeiuu", "iioau", "oueiu", "aaoeu"], ["00bb1", "ab001", "b0bb1", "11ab1"], ["0a2da", "a0c2c", "3bc2a", "b0d0c"]] 
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
	
	# print(seq_atual) # TODO: apagar isso
	


