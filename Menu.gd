extends Node


export var is_instruction_read = false

func _ready():

	OS.set_window_title("Máquina de Senhas")
	get_node("Buttons/btnJogar").connect("pressed", self, "on_button_pressed")
	get_node("Buttons/btnInstrucoes").connect("pressed", self, "on_instruction_pressed")
	get_node("Buttons/btnSair").connect("pressed", self, "on_exit_pressed")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func on_button_pressed():
	if(is_instruction_read):
		get_node("yellowCircle2/AnimationPlayer").play("blink")
		$Timer.start()
		yield($Timer, "timeout")
		get_node("/root/global")._goto_scene("MainScene.tscn")
	else: 
		get_node("redCircle/AnimationPlayer").play("blink")

func on_instruction_pressed(): 
	get_node("yellowCircle/AnimationPlayer").play("blink")
	is_instruction_read = true
	$Timer.start()
	yield($Timer, "timeout")
	get_node("/root/global")._goto_scene("Instructions.tscn")
	
func _reset(is_read, is_played):
	if(is_read):
		is_instruction_read = true
		$yellowCircle.set_visible(true)
	if(is_played):
		$yellowCircle2.set_visible(true)
	
func on_exit_pressed():
	get_tree().quit()