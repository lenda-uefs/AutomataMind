extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	pass


func _on_english_pressed():
	global.language = "english"
	TranslationServer.set_locale("en")
	global._goto_scene("main-screens/Menu.tscn")


func _on_portuguese_pressed():
	global.language = "portuguese"
	TranslationServer.set_locale("pt_BR")
	global._goto_scene("main-screens/Menu.tscn")
