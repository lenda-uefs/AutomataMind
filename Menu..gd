extends Node


func _ready():

	OS.set_window_title("Máquina de Senhas")
	get_node("Buttons/btnJogar").connect("pressed", self, "on_button_pressed")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func on_button_pressed():
	get_node("/root/global")._goto_scene("res://MainScene.tscn")
