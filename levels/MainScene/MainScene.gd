extends Node2D


var texto = ["x"]
var i = 0
var frase
export var max_tentativas = 10

var pontos = 0 
const x_pegs_pos = 1869.91870
const y_increment = 78.0
var y_pegs_pos = 224.186157


func _ready():
	
	#get_node("LineEdit").connect("update_points", self, "_calcula_pontos")
	
	get_node("Button").connect("pressed", self, "_on_btn_back")
	set_process_input(true)
	pass


func _on_btn_back():
	get_node("/root/global")._goto_scene("main-screens/lvl_selection.tscn")

func _altera_texto(num, pegs):
	y_pegs_pos += y_increment
	max_tentativas-=1;
	frase = get_node("LineEdit").get_text()
	var tries = "ScrollContainer/VBoxContainer/Tentativas/T" + str(num)
	var placeholder = "ScrollContainer/VBoxContainer/Tentativas/S" + str(num)
	var pins = preload("res://levels/MainScene/Pegs.tscn").instance()
	pins.setup(pegs)
	pins.position = Vector2(x_pegs_pos, y_pegs_pos) 
	get_node("ScrollContainer/VBoxContainer/Pinos").add_child(pins)
	
	get_node(placeholder).set_visible(true)
	get_node(tries).set_visible(true)
	get_node(tries).set_text(frase)
	get_node("Tentativas").set_text("Tentativas Restantes: " + str(max_tentativas))
	
	if(max_tentativas == 0):
			$LineEdit.editable = false # para ao chegar no número máximo de tentativas
	

func _calcula_pontos(multiplicador, acertos, tentativas):
	pontos += (multiplicador * acertos)/tentativas
	get_node("Pontos").set_text(str("Pontos: ", pontos))


