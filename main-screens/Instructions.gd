extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("btn-back").connect("pressed", self, "on_btn_pressed", ["Menu"])
	get_node("btn-forward").connect("pressed", self, "on_btn_pressed", ["instructions-2"])
	pass

func on_btn_pressed(scene):
	get_node("/root/global")._goto_scene("main-screens/" + scene + ".tscn")

