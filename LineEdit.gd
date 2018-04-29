extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var secret_seq = get_node("/root/MainScene/SecretSequence/Sequence").seq_atual
onready var seq_label = get_node("/root/MainScene/SecretSequence/Sequence")
var sequencia = []

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	self.max_length = 6
	self.connect("text_entered", self, "on_text_enter")
	pass

func on_text_enter(text): 
	print(text)
	var d = 0 
	
	if(text == secret_seq):
		self.editable = false
		seq_label._change_label("ffbabf") # MUDAR testando trocar a sequencia depois que ele acerta, vai mudar
		self.editable = true
	else: 
		for i in secret_seq:
			sequencia.append(i)
		for c in text:
			if(c == sequencia[d]):
				print("um igual")
			d = d+1
	self.set_text("")
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


