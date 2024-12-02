class_name HealEnemy extends Effect

@export var amount:int

func apply(u:Entity, t:Entity,s:ItemData=null):
    t.heal(amount)
