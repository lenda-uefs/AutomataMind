extends Node


export var is_instruction_read = false
var is_game_played = false

func _ready():
	
	set_language()
	get_node("Buttons/btnJogar").connect("pressed", self, "on_button_pressed")
	get_node("Buttons/btnInstrucoes").connect("pressed", self, "on_instruction_pressed")
	get_node("Buttons/btnSair").connect("pressed", self, "on_exit_pressed")
	pass


func set_language():
	if(global.language == "english"):
		get_node("gameTitle").text = "AutomataMind"
		get_node("Buttons/btnInstrucoes").text = "INSTRUCTIONS"
		get_node("Buttons/btnJogar").text = "PLAY"
		get_node("Buttons/btnSair").text = "QUIT"
	else: 
		get_node("gameTitle").text = "Máquina de Senhas"
		get_node("Buttons/btnInstrucoes").text = "INSTRUÇÕES"
		get_node("Buttons/btnJogar").text = "JOGAR"
		get_node("Buttons/btnSair").text = "SAIR"

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
	global._goto_scene("main-screens/Instructions.tscn")
	

func on_exit_pressed():
	get_node("unlock").set_visible(true)
	
	if(is_instruction_read and is_game_played): 
		get_node("yellowCircle3/AnimationPlayer").play("blink")
	$Timer.start()
	yield($Timer, "timeout")
	
	global.save_settings()
	
	get_tree().quit()

func _reset(is_read, is_played):
	if(is_read):
		is_instruction_read = true
		$yellowCircle.set_visible(true)
	if(is_played):
		is_game_played = true
		$yellowCircle2.set_visible(true)
	

