extends Node2D


var texto = ["x"]
var i = 0
var frase
var pontos = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("LineEdit").connect("update_points", self, "_calcula_pontos")
	get_node("Button").connect("pressed", self, "_on_btn_back")
	
	set_process_input(true)
	pass

func _fixed_process(delta):
	
	pass

func _on_btn_back():
	get_node("/root/global")._goto_scene("Menu.tscn")

func _altera_texto(num):
	frase = get_node("LineEdit").get_text()
	var node = "ScrollContainer/VBoxContainer/Tentativas/T" + str(num)
	get_node(node).set_visible(true)
	get_node(node).set_text(frase)
	

func _calcula_pontos(multiplicador, acertos, tentativas):
	pontos += (multiplicador * acertos)/tentativas
	get_node("Pontos").set_text(str("Pontos: ", pontos))

func _clear_tries():
	for i in range (0, 6):
		var node = "ScrollContainer/VBoxContainer/Tentativas/T" + str(i)
		get_node(node).set_text("")



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
