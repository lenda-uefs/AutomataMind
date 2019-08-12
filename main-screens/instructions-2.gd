extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pt_br = ["2. Analise quão perto sua tentativa chegou da senha secreta: ", "Pinos brancos significam que existe um símbolo correto (presente na senha), mas na posição errada", "Pinos vermelhos significam que existe um símbolo correto na posição correta", "Uma confirmação signfica que a sequência inserida é reconhecida pelo autômato, mesmo que esta não seja a senha correta", "Supondo que a senha seja [color=#f5b942]baba[/color] e o seu chute seja [color=#f5b942]bbab[/color]", "Um pino [color=red]vermelho[/color] pelo primeiro [color=red]b[/color], que está na posição correta. Dois pinos [color=white]brancos[/color] por um [color=white]b[/color] e um [color=white]a[/color] que fazem parte da senha, mas não estão na posição correta.", "[color=red]Obs.:[/color] os pinos não necessariamente estarão na ordem de acerto dos símbolos"]
var en = ["2. Analyze how close your guess got to the secret passcode: ", "White pegs mean there is a correct symbol (a symbol that is present in the password), but in the wrong position", "Red pegs mean that there is a match: a correct symbol in the correct position", "A verification sign means that the sequence you typed in is accepted by the automaton, even if it doesn't correspond to the correct password", "Suppose the password is [color=#f5b942]baba[/color] and your guess is  [color=#f5b942]bbab[/color]", "A [color=red]red[/color] peg for the first  [color=red]b[/color], that is placed correctly. Two [color=white]white[/color] pegs corresponding to a [color=white]b[/color] and an [color=white]a[/color] that are present in the password, but are not placed in the correct position", ""]

func _ready():
	set_language()
	get_node("btn-back").connect("pressed", self, "on_btn_pressed", ["Instructions"]) 
	get_node("btn-menu").connect("pressed", self, "on_btn_pressed", ["Menu"])
	pass

func set_language():
	if(global.language == "english"):
		var i = 0 
		for txt in en:
			get_node("text_" + str(i)).text = txt
			
			if(i >= 4):
				get_node("text_" + str(i)).bbcode_text = txt
			i = i + 1

func on_btn_pressed(scene):
	global._goto_scene("main-screens/" + scene + ".tscn")

