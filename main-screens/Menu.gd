extends Node


export var is_instruction_read = false
var is_game_played = false

func _ready():
	
	get_node("Buttons/btnJogar").connect("pressed", self, "on_button_pressed")
	get_node("Buttons/btnInstrucoes").connect("pressed", self, "on_instruction_pressed")
	get_node("Buttons/btnSair").connect("pressed", self, "on_exit_pressed")
	pass


func on_button_pressed():
	if(is_instruction_read):
		get_node("yellowCircle2/AnimationPlayer").play("blink")
		$Timer.start()
		yield($Timer, "timeout")
		get_node("/root/global")._goto_scene("main-screens/lvl_selection.tscn")
	else: 
		get_node("redCircle/AnimationPlayer").play("blink")
		

func on_instruction_pressed(): 
	get_node("yellowCircle/AnimationPlayer").play("blink")
	is_instruction_read = true
	$Timer.start()
	yield($Timer, "timeout")
	get_node("/root/global")._goto_scene("main-screens/Instructions.tscn")
	

func on_exit_pressed():
	get_node("unlock").set_visible(true)
	
	if(is_instruction_read and is_game_played): 
		get_node("yellowCircle3/AnimationPlayer").play("blink")
	$Timer.start()
	yield($Timer, "timeout")
	
	get_tree().quit()

func _reset(is_read, is_played):
	if(is_read):
		is_instruction_read = true
		$yellowCircle.set_visible(true)
	if(is_played):
		is_game_played = true
		$yellowCircle2.set_visible(true)
	

