class_name PlayerStats extends GridContainer

@onready var hp_bar: ProgressBar = $HPBar
@onready var mp_bar: ProgressBar = $MPBar
@onready var label: Label = $Label

func set_bars(player:Entity):
    hp_bar.max_value = player.max_hp
    hp_bar.value = player.hp
    mp_bar.max_value=player.max_mp
    mp_bar.value=player.mp
    label.text = str(player.gold)

func _process(delta: float) -> void:
    if BattleManager.player.data!=null:
        set_bars(BattleManager.player.data)
        
