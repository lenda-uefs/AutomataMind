extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var secret_seq = get_node("/root/MainScene/SecretSequence/Sequence").seq_atual
onready var seq_label = get_node("/root/MainScene/SecretSequence/Sequence")
onready var parent = get_parent()
onready var global = get_node("/root/global")
var sequencia = []
var i = 0 # índice para iterar tentativas

signal update_points() # sinal para saber quando atualizar os pontos

func _ready():
	
	self.max_length = 4 # número máximmo de caracteres
	self.connect("text_entered", self, "on_text_enter")
	pass

func on_text_enter(text): 
	print(text)
	var d = 0 # índice pra iterar sequencia de caracteres
	
	# testando trocar cor do texto: get_node("/root/MainScene/LabelTeste").add_color_override("font_color", Color(1,0,1,1))
	
	if(text == secret_seq):
		i = 0
		self.editable = false
		
		self.get_parent()._clear_tries() # TODO: talvz possa mudar isso, acho que não precisa
		global.cur_lvl+=1;
		if(global.cur_lvl == 3 or global.cur_lbl == 6):
			self.max_length += 1;
		
		self.editable = true
		emit_signal("update_points")
	else: 
		for c in text:
			if(c == secret_seq[d]):
				print("um correto")
			d = d+1
		print(get_node("/root/MainScene/Automato").automato_0(text))
		get_node("/root/MainScene")._altera_texto(i)
		i = i+1
		self.set_text("")
	
