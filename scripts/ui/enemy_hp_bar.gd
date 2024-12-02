extends ProgressBar
@onready var enemy_name_label: Label = $"../EnemyNameLabel"

var defeated=false

func _ready():
    Signals.set_enemy_health.connect(set_bar)
    Signals.get_next_enemy.connect(reset_defeat)
    
func set_bar(e:Entity):
    max_value = e.max_hp
    value = e.hp

func reset_defeat():
    defeated=false    

func _process(delta: float) -> void:
    if BattleManager.enemy.data!=null:
        set_bar(BattleManager.enemy.data)
        if value <= 0 and !defeated:
            Signals.switch_state.emit("end")
            defeated=true
        else:
            defeated=false
