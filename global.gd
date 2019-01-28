extends Node

var cur_scene = null 
var res = "res://"
var path
var menu = null
var is_instruction_read
var is_game_played

export var cur_lvl = 0

func _ready():
	var root = get_tree().get_root()
	cur_scene = root.get_child(root.get_child_count() - 1)
	
	pass

func _goto_scene(scene):
	
	path = res + scene
	
	call_deferred("_deferred_goto_scene", path)
	
#	cur_scene = path + scene
#	get_tree().change_scene(cur_scene)
	
	
	
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
	elif(scene_name == "MainScene"):
		is_game_played = true
	