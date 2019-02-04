extends Node2D


var texto = ["x"]
var i = 0
var frase
export var max_tentativas = 7
var pontos = 0 

func _ready():
	
	# get_node("LineEdit").connect("update_points", self, "_calcula_pontos")
	get_node("Button").connect("pressed", self, "_on_btn_back")
	set_process_input(true)
	pass


func _on_btn_back():
	get_node("/root/global")._goto_scene("main-screens/lvl_selection.tscn")

func _altera_texto(num):
	max_tentativas-=1;
	frase = get_node("LineEdit").get_text()
	var node = "ScrollContainer/VBoxContainer/Tentativas/T" + str(num)
	var placeholder = "ScrollContainer/VBoxContainer/Tentativas/S" + str(num)
	var pins = "ScrollContainer/VBoxContainer/Pinos/P" + str(num)
	get_node(placeholder).set_visible(true)
	get_node(pins).set_visible(true)
	get_node(node).set_visible(true)
	get_node(node).set_text(frase)
	get_node("Tentativas").set_text("Tentativas Restantes: " + str(max_tentativas))
	
	if(max_tentativas == 0):
			$LineEdit.editable = false # para ao chegar no número máximo de tentativas
	

func _calcula_pontos(multiplicador, acertos, tentativas):
	pontos += (multiplicador * acertos)/tentativas
	get_node("Pontos").set_text(str("Pontos: ", pontos))

func _clear_tries():
	for i in range (0, 6):
		var node = "ScrollContainer/VBoxContainer/Tentativas/T" + str(i)
		get_node(node).set_text("")

