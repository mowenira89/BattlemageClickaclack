class_name HealEffect extends Effect

@export var amount:int

func apply(u:Entity, t:Entity,s:ItemData=null):
    u.heal(amount)
