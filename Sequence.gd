extends Label


var sequencias = ["bbbaba", "aaabbb", "babbba", "aaaaab"]
var rand

export var seq_atual = ""

func _ready():
	
	
	randomize()
	rand = randi() % 4 # retorna número aleatória entre 0 e 3
	
	seq_atual = sequencias[rand]
	
	self.set_text(seq_atual)
	
	
	pass
	

func _change_label(label):
	seq_atual = label
	self.set_text(seq_atual)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
