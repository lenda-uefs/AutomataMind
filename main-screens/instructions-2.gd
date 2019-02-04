extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("btn-back").connect("pressed", self, "on_btn_pressed", ["Instructions"]) 
	get_node("btn-menu").connect("pressed", self, "on_btn_pressed", ["Menu"])
	pass

func on_btn_pressed(scene):
	get_node("/root/global")._goto_scene("main-screens/" + scene + ".tscn")

