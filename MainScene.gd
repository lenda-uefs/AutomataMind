extends Node2D


var texto = ["x"]
var i = 0
var frase

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	
	set_process_input(true)
	pass

func _fixed_process(delta):
	
	pass

func _altera_texto(num):
	frase = get_node("LineEdit").get_text()
	var node = "Tentativas/T" + str(num)
	get_node(node).set_text(frase)
	
#func _input(event):
	#if event.is_action_pressed("ui_type"): 
	#	texto.append("a")
	#	i = i + 1
	#if(texto.size() > 0):
	#	get_node("/root/MainScene/Teste").set_text(str(texto[1]));
	#pass


#func _input(event):
#	if(event.type == InputEvent.KEY and event.is_pressed()):
#		var s = OS.get_scancode_string(event.scancode)
#		self.texto = self.texto + s
#		frase = PoolStringArray(texto).join()
#	get_node("/root/MainScene/Teste").set_text(frase)
