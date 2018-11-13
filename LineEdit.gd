extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var secret_seq = get_node("/root/MainScene/SecretSequence/Sequence").seq_atual
onready var seq_label = get_node("/root/MainScene/SecretSequence/Sequence")
onready var parent = get_parent()
var sequencia = []
var i = 0 # índice para iterar tentativas

signal update_points() # sinal para saber quando atualizar os pontos

func _ready():
	
	self.max_length = 6 # número máximmo de caracteres
	self.connect("text_entered", self, "on_text_enter")
	pass

func on_text_enter(text): 
	print(text)
	var d = 0 # índice pra iterar sequencia de caracteres
	
	# testando trocar cor do texto: get_node("/root/MainScene/LabelTeste").add_color_override("font_color", Color(1,0,1,1))
	
	if(text == secret_seq):
		i = 0
		self.editable = false
		self.get_parent()._clear_tries()
		seq_label._get_next_seq() # MUDAR testando trocar a sequencia depois que ele acerta, vai mudar
		get_node("/root/MainScene/Automato").texture = load("res://imgs/automato2.png") # MUDAR trocar autômato depois que acerta
		
		parent.get_node("Mudou").set_visible(true)
		parent.get_node("Timer").start()
		yield(parent.get_node("Timer"), "timeout")
		parent.get_node("Mudou").set_visible(false)
		
		self.editable = true
		emit_signal("update_points")
	else: 
		#for i in secret_seq:
		#	sequencia.append(i)
		for c in text:
			if(c == secret_seq[d]):
				print("um correto")
			d = d+1
			
		get_node("/root/MainScene")._altera_texto(i)
		i = i+1
		self.set_text("")
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


