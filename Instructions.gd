extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Button").connect("pressed", self, "_on_go_back")
	pass

func _on_go_back():
	get_node("/root/global")._goto_scene("Menu.tscn")
	#get_node("/root/global").reset_menu()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
