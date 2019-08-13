extends Node

var cur_scene = null 
var res = "res://"
var path
var menu = null
var is_instruction_read
var is_game_played
var language = null 

export var cur_lvl = 0
export var lvls_unlocked = 0

func _ready():
	
	load_settings()
	var root = get_tree().get_root()
	cur_scene = root.get_child(root.get_child_count() - 1)
	
	pass

func load_settings():
	
	save_system.load_settings()
	
	language = save_system.settings["language"]["option"]
	is_instruction_read = save_system.settings["game_save"]["is_instruction_read"]
	is_game_played = save_system.settings["game_save"]["is_game_played"]
	lvls_unlocked = save_system.settings["game_save"]["unlocked_lvls"] 
	

func _goto_scene(scene):
	
	path = res + scene
	
	call_deferred("_deferred_goto_scene", path)
	

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_settings()
		get_tree().quit() 
		

func reset_menu():
	menu._reset(is_instruction_read, is_game_played)

func go_back():
	get_tree().set_current_scene(menu)

func _deferred_goto_scene(path):
	
	cur_scene.free()
	var s = ResourceLoader.load(path)
	cur_scene = s.instance()
	get_tree().get_root().add_child(cur_scene)
	get_tree().set_current_scene(cur_scene)
	
	var scene_name = get_tree().get_current_scene().get_name();
	
	if(scene_name == "Menu"):
		menu = get_tree().get_current_scene()
		reset_menu()
	elif(scene_name == "Instructions"):
		is_instruction_read = true
	elif(scene_name == "LevelSelection"):
		is_game_played = true

func save_settings():
	
	save_system.settings["language"]["option"] = language
	save_system.settings["game_save"]["is_instruction_read"] = is_instruction_read
	save_system.settings["game_save"]["is_game_played"] = is_game_played
	save_system.settings["game_save"]["unlocked_lvls"]  = lvls_unlocked
	
	save_system.save_settings()
	