extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("lvl_0").connect("pressed", self, "on_btn_pressed");
	pass



#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func on_btn_pressed():
	get_node("/root/global")._goto_scene("/levels/lvl_0.tscn")