extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	
	unlock_lvl()
	get_node("lvl_imgs/lvl_0").connect("pressed", self, "on_lvl_pressed", [0]);
	get_node("lvl_imgs/lvl_1").connect("pressed", self, "on_lvl_pressed", [1]);
	get_node("lvl_imgs/lvl_2").connect("pressed", self, "on_lvl_pressed", [2]);
	get_node("lvl_imgs/lvl_3").connect("pressed", self, "on_lvl_pressed", [3]);
	get_node("lvl_imgs/lvl_4").connect("pressed", self, "on_lvl_pressed", [4]);
	get_node("lvl_imgs/lvl_5").connect("pressed", self, "on_lvl_pressed", [5]);
	get_node("lvl_imgs/lvl_6").connect("pressed", self, "on_lvl_pressed", [6]);
	get_node("lvl_imgs/lvl_7").connect("pressed", self, "on_lvl_pressed", [7]);
	get_node("Button").connect("pressed", self, "on_btn_pressed")
	
	pass


func on_btn_pressed():
	global._goto_scene("main-screens/Menu.tscn")


func on_lvl_pressed(lvl):
	if(lvl == 0):
		global._goto_scene("levels/lvl_0.tscn")
		global.cur_lvl = 0
	else:
		if(lvl < 8):
			var goto_level = "levels/lvl_" + str(lvl) + ".tscn"
			if(global.lvls_unlocked >= lvl):
				global._goto_scene(goto_level)
				global.cur_lvl = lvl
			else:
				get_node("Popup").show()
				$Timer.start()
				yield($Timer, "timeout")
				$Popup.hide()


func unlock_lvl():
		for i in range (0, global.lvls_unlocked+1):
			var path = "lvl_imgs/lvl_" + str(i)
			get_node(path).texture_normal = load("res://imgs/" + str(i) + "_lvl.png") 
			get_node(path).texture_hover = load("res://imgs/" + str(i) + "_lvl_hover.png")
