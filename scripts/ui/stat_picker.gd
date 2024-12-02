class_name StatPicker extends HBoxContainer

@onready var hp_box: StatBox = $HPBox
@onready var mp_box: StatBox = $MPBox
@onready var melee_box: StatBox = $MeleeBox
@onready var magic_box: StatBox = $MagicBox
@onready var def_box: StatBox = $DefBox
@onready var mag_def: StatBox = $MagDef
@onready var speed: StatBox = $Speed
@onready var mp_regen: StatBox = $MPRegen
@onready var stats = [hp_box,mp_box,melee_box,magic_box,def_box,mag_def,speed,mp_regen] 
@onready var points_available_label: Label = $PanelContainer/VBoxContainer/PointsAvailableLabel
@onready var buy: Button = $PanelContainer/VBoxContainer/Buy

var points_available:int=0
var temp_points={}
    
var new_game=true
    
func _ready():
    Signals.temp_stats.connect(change_points_available)
    Signals.send_stats.connect(set_stats)
    
func set_arrows():
    for x in stats:
        x.set_arrows()

func request_stats():
    Signals.request_stats.emit()
    
func set_stats(s):
    for x in range(0,s.size()-1):
        stats[x].set_stat(s[x])


func change_points_available(d:int):
    points_available+=d
    points_available_label.text = str(points_available)
    set_arrows()
    
func _on_confirm_pressed() -> void:
    var stat_dict = {}
    for x in range(0,stats.size()-1):
        stat_dict[x]=stats[x].num
    Signals.update_stat.emit(stat_dict)
    if new_game:
        new_game=false
        buy.visible=true
        Signals.start_new_game.emit()


func _on_buy_pressed() -> void:
    var pgold =  BattleManager.player.data.gold
    if pgold - 50 >=0:
        change_points_available(1)
