class_name Player extends Node

var data:PlayerData
var d = []

func _ready():
    Signals.start_new.connect(set_player)
    Signals.request_stats.connect(send_stats)
    Signals.update_stat.connect(update_stats)
    BattleManager.player=self

func set_player(p:PlayerData):
    data=p
    d = [data.max_hp, data.max_mp, data.melee, data.magic, data.melee_def, data.magic_def, data.speed, data.mp_regen]


    
func send_stats():
    Signals.send_stats.emit(d)

func update_stats(info:Dictionary):
    for x in info:
        d[x]=info[x]
