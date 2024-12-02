class_name BattleStart extends State
@onready var player_turn: PlayerTurn = $"../PlayerTurn"
@onready var enemy_turn: EnemyTurn = $"../EnemyTurn"

func enter():
    Signals.get_next_enemy.emit(BattleManager.player.data.level)
    var player = BattleManager.player.data
    var enemy = BattleManager.enemy.data
    if player.speed>=enemy.speed:
        BattleManager.turns=[player,enemy]
        state_machine.change_state(player_turn)
    else:
        BattleManager.turns=[enemy,player]
        state_machine.change_state(enemy_turn)


func exit():
    pass
