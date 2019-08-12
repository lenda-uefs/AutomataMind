extends Node2D


var texto = ["x"]
var i = 0
var frase
var tentativas = ""
var num_of_chars = 4
export var max_tentativas = 10

var pontos = 0 
const x_pegs_pos = 1869.91870
const y_increment = 78.0
var y_pegs_pos = 224.186157


func _ready():
	
	set_language()
	if(global.cur_lvl == 5):
		y_pegs_pos = 268.18
		num_of_chars = 5
	get_node("Button").connect("pressed", self, "_on_btn_back")
	set_process_input(true)
	pass

func set_language():
	tentativas = tr("NUM_GUESSES")
	$Tentativas.text = tentativas + str(max_tentativas)
	$Senha.text = tr("NUM_CHARS") % str(num_of_chars)
	

func _on_btn_back():
	global._goto_scene("main-screens/LevelSelection.tscn")

func _altera_texto(num, pegs):
	
	y_pegs_pos += y_increment
	max_tentativas-=1;
	frase = get_node("LineEdit").get_text()
	
	
	var tries = "ScrollContainer/VBoxContainer/Tentativas/T" + str(num)
	var placeholder = "ScrollContainer/VBoxContainer/Tentativas/S" + str(num)
	var pins = preload("res://levels/MainScene/Pegs.tscn").instance()
	
	if("11" in frase or "121" in frase or "131" in frase):
		get_node(tries).set("custom_fonts/font", load("res://fonts/Aldrich/aldrich-spacing.tres"))
	
	pins.setup(pegs)
	pins.position = Vector2(x_pegs_pos, y_pegs_pos) 
	if(global.cur_lvl >= 5):
		pins.texture = load("res://imgs/5_pins.png")
	get_node("ScrollContainer/VBoxContainer/Pinos").add_child(pins)
	
	get_node(placeholder).set_visible(true)
	get_node(tries).set_visible(true)
	get_node(tries).set_text(frase)
	$Tentativas.set_text(tentativas + str(max_tentativas))
	
	if(max_tentativas == 0):
			$LineEdit.editable = false # para ao chegar no número máximo de tentativas
	

func _calcula_pontos(multiplicador, acertos, tentativas):
	pontos += (multiplicador * acertos)/tentativas
	$Pontos.set_text(str("Pontos: ", pontos))


