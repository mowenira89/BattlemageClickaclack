class_name Move extends Resource

@export var name:String
@export var unmissable:bool
@export var accuracy:int
@export var effect:Array[Effect]

func use(user:Entity,target:Entity): 
    for e in effect:
        var t = BattleManager.player.data if e.target==e.targets.PLAYER else BattleManager.enemy.data
        e.apply(user,t)
