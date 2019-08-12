extends Node


export var is_instruction_read = false
var is_game_played = false

func _ready():
	
	set_language()
	$Buttons/btnJogar.connect("pressed", self, "on_button_pressed")
	$Buttons/btnInstrucoes.connect("pressed", self, "on_instruction_pressed")
	$Buttons/btnSair.connect("pressed", self, "on_exit_pressed")
	pass


func set_language():
		$gameTitle.text = tr("GAME_TITLE")
		$Buttons/btnInstrucoes.text = tr("BTN_INSTR")
		$Buttons/btnJogar.text = tr("BTN_PLAY")
		$Buttons/btnSair.text = tr("BTN_QUIT")

func on_button_pressed():
	if(is_instruction_read):
		$yellowCircle2/AnimationPlayer.play("blink")
		$Timer.start()
		yield($Timer, "timeout")
		global._goto_scene("main-screens/LevelSelection.tscn")
	else: 
		$redCircle/AnimationPlayer.play("blink")
		

func on_instruction_pressed(): 
	$yellowCircle/AnimationPlayer.play("blink")
	is_instruction_read = true
	$Timer.start()
	yield($Timer, "timeout")
	global._goto_scene("main-screens/Instructions.tscn")
	

func on_exit_pressed():
	get_node("unlock").set_visible(true)
	
	if(is_instruction_read and is_game_played): 
		$yellowCircle3/AnimationPlayer.play("blink")
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
	

