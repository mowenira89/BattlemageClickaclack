class_name BetweenTurns extends State
@onready var player_turn: PlayerTurn = $"../PlayerTurn"
@onready var enemy_turn: EnemyTurn = $"../EnemyTurn"

func init():
    pass
    
func enter():
    var player = BattleManager.player.data
    var enemy = BattleManager.enemy.data
    if player.speed>=enemy.speed:
        state_machine.change_state(player_turn)
    else:
        state_machine.change_state(enemy_turn)
    
func exit():
    pass
    
func process(delta)->State:
    return null
    
func physics(delta)->State:
    return null

func handle_input(event)->State:
    return null
