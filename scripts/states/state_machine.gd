class_name StateMachine extends Node

var states=[]
var prev_state:State
var current_state:State
@onready var battle_start: BattleStart = $BattleStart
@onready var player_turn: PlayerTurn = $PlayerTurn
@onready var enemy_turn: EnemyTurn = $EnemyTurn
@onready var battle_end: BattleEnd = $BattleEnd
@onready var between_battle: BetweenBattle = $BetweenBattle
@onready var menu_state: MenuState = $Menu
@onready var between_turns: State = $BetweenTurns


func _ready():
    process_mode=Node.PROCESS_MODE_DISABLED
    Signals.switch_state.connect(switch_state)
    
func initialize():	
    for c in get_children():
        if c is State: states.append(c)
    if states.size()>0:
        for x in states:
            x.state_machine=self
            x.init()
        change_state(states[0])
        process_mode = Node.PROCESS_MODE_INHERIT

func _process(delta):
    change_state(current_state.process(delta))
    
func _physics_process(delta):
    change_state(current_state.physics(delta))
    
func _unhandled_input(event):
    change_state(current_state.handle_input(event))
    
func change_state(new_state:State):
    if new_state==null or new_state==current_state:return
    if current_state: current_state.exit()
    prev_state=current_state
    current_state=new_state
    current_state.enter()

func switch_state(s:String):
    match s:
        'start':change_state(battle_start)
        'menu':change_state(menu_state)
        'enemy_turn':change_state(enemy_turn)
        'between_turns':change_state(between_turns)
        'player_turn':change_state(player_turn)
        'end':change_state(battle_end)
