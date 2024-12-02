class_name Buff extends Resource

var owner:Entity
var stat:Entity.stats
var amount:int
var turns:int=1


func reduce_turn():
    turns-=1
    if turns==0:
        erase()

func erase():
    owner.buffs.erase(self)
