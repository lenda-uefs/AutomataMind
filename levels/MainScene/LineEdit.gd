extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var secret_seq = get_node("/root/MainScene/SecretSequence/Sequence").seq_atual
onready var seq_label = get_node("/root/MainScene/SecretSequence/Sequence")
onready var parent = get_parent()
onready var global = get_node("/root/global")
onready var max_tries = get_node("../").max_tentativas
var sequencia = ""
var i = 0 # índice para iterar tentativas

signal update_points() # sinal para saber quando atualizar os pontos

func _ready():
	
	self.max_length = 4 # número máximmo de caracteres
	if(global.cur_lvl == 3 or global.cur_lvl == 6):
		self.max_length += 1;
	self.connect("text_entered", self, "on_text_enter")
	pass

func on_text_enter(text): 
	sequencia = secret_seq
	print(text)
	var d = 0 # índice pra iterar sequencia de caracteres
	
	if(text == secret_seq):
		i = 0
		self.editable = false
		
		self.get_parent()._clear_tries() # TODO: talvz possa mudar isso, acho que não precisa
		global.lvls_unlocked+=1
		
		self.editable = true
		emit_signal("update_points")
	else: 
		
		var correct = get_node("/root/MainScene/ScrollContainer/VBoxContainer/Verificacao/V" + str(i)) 
		if(get_node("/root/MainScene/Automato").automato_0(text)):
			correct.texture = load("res://imgs/correct.png")
			correct.set_visible(true)
		
		
		for c in text:
			if(c == secret_seq[d]):
				print("vermelho")
				text[d] = "-"
				sequencia[d] = "*"
			d = d+1
		
		d = 0
		
		for c in text:
			var result = sequencia.find(c, 0)
			if(result != -1):
				print("branco")
				text[d] = "-"
				sequencia[result] = "*"
			d = d+1
		
		get_node("/root/MainScene")._altera_texto(i)
		i = i+1
		self.set_text("")
	
