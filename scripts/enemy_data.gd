class_name EnemyData extends Entity

enum types {Slime,Goblinoid,Beast,Lycanthrope,Undead,Dragon,Artifact}

@export var image:Texture2D
@export var name:String
@export var data_name:String
@export var type:types
@export var level:int
@export var rarity:int
@export var boss:bool=false
@export_multiline var flavor_text:String
@export var moves:Array[Move]

 
func take_damage(d:int):
    super(d)
    Signals.set_enemy_health.emit(self)
