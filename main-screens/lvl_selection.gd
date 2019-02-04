extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var global = get_node("/root/global")


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("lvl_0").connect("pressed", self, "on_lvl_pressed", [0]);
	get_node("lvl_1").connect("pressed", self, "on_lvl_pressed", [1]);
	get_node("lvl_2").connect("pressed", self, "on_lvl_pressed", [2]);
	get_node("lvl_3").connect("pressed", self, "on_lvl_pressed", [3]);
	get_node("lvl_4").connect("pressed", self, "on_lvl_pressed", [4]);
	get_node("lvl_5").connect("pressed", self, "on_lvl_pressed", [5]);
	get_node("lvl_6").connect("pressed", self, "on_lvl_pressed", [6]);
	get_node("lvl_7").connect("pressed", self, "on_lvl_pressed", [7]);
	get_node("Button").connect("pressed", self, "on_btn_pressed")
	pass

func on_btn_pressed():
	global._goto_scene("main-screens/Menu.tscn")


func on_lvl_pressed(lvl):
	if(lvl == 0):
		global._goto_scene("/levels/lvl_0.tscn")
		global.cur_lvl = 0
	else:
		var goto_level = "/levels/lvl_" + str(lvl) + ".tscn"
		if(global.lvls_unlocked >= lvl):
			global._goto_scene(goto_level)
			global.cur_lvl = lvl
		else:
			get_node("Popup").show()
			$Timer.start()
			yield($Timer, "timeout")
			$Popup.hide()
