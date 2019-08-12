extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_language()
	$btn-back.connect("pressed", self, "on_btn_pressed", ["Instructions"]) 
	$btn-menu.connect("pressed", self, "on_btn_pressed", ["Menu"])
	pass

func set_language():
		var i = 0 
		while(i < 7):
			get_node("text_" + str(i)).text = tr("INSTR_" + str(i))
			
			if(i >= 4):
				get_node("text_" + str(i)).bbcode_text = tr("INSTR_" + str(i))
			i = i + 1

func on_btn_pressed(scene):
	global._goto_scene("main-screens/" + scene + ".tscn")

