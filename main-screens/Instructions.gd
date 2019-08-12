extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var pt_br = ["Instruções", "O objetivo do jogo é descobrir um código oculto com base no autômato exibido na fase. A cada tentativa, são fornecidas dicas sobre quão próximo da senha secreta o seu palpite chegou", "Para jogar, siga os passos abaixo:", "1. Insira uma sequência de caracteres que possa ser reconhecida pelo autômato."]

var en = ["Instructions", "Your goal is to uncover a hidden password based on an automaton presented to you during each level. Every time you make a guess, hints will be provided regarding how close to the secret code you got.", "In order to play, follow these steps:", "1. Type in a sequence of characters that can be accepted by the automaton."]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_language()
	get_node("btn-back").connect("pressed", self, "on_btn_pressed", ["Menu"])
	get_node("btn-forward").connect("pressed", self, "on_btn_pressed", ["instructions-2"])
	pass

func on_btn_pressed(scene):
	global._goto_scene("main-screens/" + scene + ".tscn")

func set_language():
	if(global.language == "english"):
		var i = ""
		$title.text = en[0]
		$text_0.text = en[1]
		$text_1.text = en[2]
		$text_2.text = en[3]
	else: 
		$title.text = en[0]
		$text_0.text = en[1]
		$text_1.text = en[2]
		$text_2.text = en[3]