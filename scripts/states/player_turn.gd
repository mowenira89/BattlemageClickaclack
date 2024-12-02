class_name PlayerTurn extends State

var can_attack:bool=false
@onready var enemy_turn: EnemyTurn = $"../EnemyTurn"
@onready var between_turns: BetweenTurns = $"../BetweenTurns"
@onready var battle_end: BattleEnd = $"../BattleEnd"

func enter():
    can_attack=true
    Signals.enemy_clicked.connect(attack_enemy)

func exit():
    Signals.enemy_clicked.disconnect(attack_enemy)
    
func attack_enemy():
    if can_attack:
        can_attack=false
        BattleManager.attack_enemy()
        
