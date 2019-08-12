extends Node

const SAVE_PATH = "user://config.cfg"

var config_file = ConfigFile.new()
var settings = {
	
	"language": {
			"option" : "portuguese"
	},
	
	"game_save": {
		"is_instruction_read": false, 
		"is_game_played": false,
		"unlocked_lvls": 0
	}
}

func save_settings():
	for section in settings.keys():
		for key in settings[section].keys():
			config_file.set_value(section, key, settings[section][key])
	
	config_file.save(SAVE_PATH)
	

func load_settings(): 
	var error = config_file.load(SAVE_PATH)
	if(error != OK):
		print("Failed!")
		return []
	
	for section in settings.keys():
		for key in settings[section].keys():
			settings[section][key] = config_file.get_value(section, key, settings[section][key])
	
	




