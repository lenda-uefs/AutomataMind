extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_language()
	get_node("btn-back").connect("pressed", self, "on_btn_pressed", ["Menu"])
	get_node("btn-forward").connect("pressed", self, "on_btn_pressed", ["Instructions_2"])
	pass

func on_btn_pressed(scene):
	global._goto_scene("main-screens/" + scene + ".tscn")

func set_language():
	
		$title.text = tr("INSTR_TITLE")
		$text_0.text = tr("INSTR_GOAL")
		$text_1.text = tr("INSTR_TOPLAY")
		$text_2.text = tr("INSTR_STEP1")
	