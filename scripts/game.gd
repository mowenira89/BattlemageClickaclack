class_name Game extends Node2D

@onready var enemy = $Enemy
@onready var player: Node = $Player
@onready var welcome_panel: WelcomePanel = $CanvasLayer/WelcomePanel
@onready var state_machine: StateMachine = $StateMachine

func _ready():
    state_machine.initialize()
    Signals.save_game.connect(save_game)
    Signals.load_game.connect(load_game)
    
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
        player.set_player(save_data['player_data'])
        enemy.set_enemy(save_data['enemy_data'])
        file.close()
        return true


func _on_message_gui_input(event: InputEvent) -> void:
    pass # Replace with function body.
