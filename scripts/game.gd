class_name Game extends Node2D

@onready var enemy = $Enemy
@onready var player: Node = $Player
@onready var welcome_panel: Panel = $CanvasLayer/WelcomePanel


func _on_button_pressed() -> void:
	if load_game(0):
		enemy.set_enemy()
	welcome_panel.visible=false
	
var save_data = {
	
}

func get_save_file_path(slot: int) -> String:
	return "user://save_slot_%d.json" % slot
	
func save_game(slot: int) -> void:	
	save_data['player_data']=player.data
	save_data['enemy_data']=enemy.data
	var file = FileAccess.open(get_save_file_path(slot), FileAccess.WRITE)
	file.store_var(save_data,true)
	file.close()
	
func load_game(slot:int):
	if FileAccess.file_exists(get_save_file_path(slot)):
		var file = FileAccess.open(get_save_file_path(slot),FileAccess.READ)
		save_data=file.get_var(true)
		if get_tree().change_scene_to_file(save_data['scene_path'])==ERR_CANT_CREATE:
			print('failed')
			file.close()
			return false
		else:
			player.set_player(save_data['player_data'])
			file.close()
			return true
