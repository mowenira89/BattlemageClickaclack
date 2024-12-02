class_name MeleeDamage extends Effect

@export var min_damage:int
@export var max_damage:int

func apply(u:Entity, t:Entity, s:ItemData=null):
    var item_damage = randi_range(min_damage,max_damage+1)
    var damage = (u.melee/t.melee_def)+item_damage
    t.take_damage(damage*-1)
    Signals.send_message.emit(t.name+" takes "+str(damage)+" melee damage!")
        
