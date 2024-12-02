class_name VictoryPanel extends Panel
@onready var victory_label: Label = $MarginContainer/VBoxContainer/VictoryLabel
@onready var current_label: Label = $MarginContainer/VBoxContainer/CurrentLabel

func _ready():
    Signals.enemy_defeated.connect(set_label)

func set_label():
    visible=true
    var enemy = BattleManager.enemy.data
    victory_label.text = enemy.name
    current_label.text = str(enemy.gold)+" current flows into you."
    


func _on_proceed_pressed() -> void:
    visible=false
    Signals.switch_state.emit('start')
