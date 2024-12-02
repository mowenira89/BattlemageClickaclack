class_name Entity extends Resource
enum attack_types {Melee,Magic,Fish,Fire,Ice,Lightning,Absurdity}

var _name:String
@export var max_hp:int
@export var hp:int
@export var max_mp:int
@export var mp:int
@export var melee:int
@export var magic:int
@export var melee_def:int
@export var magic_def:int
@export var speed:int
@export var evasion:int
@export var accuracy:int
@export var crit:int
@export var gold:int
@export var weakness:Array[attack_types]
@export var resistance:Array[attack_types]
enum stats {MAX_HP,HP,MAX_MP,MP,MELEE,MAGIC,DEF,MAGDEF,SPEED,ACCURACY,EVASION,MP_REGEN}


var inventory = []
var loot = []
var buffs = []

func change_hp(d:int):
    hp = clamp(hp+d,0,max_hp)

func change_mp(d:int):
    mp = clamp(mp+d,0,max_mp)
    
func take_damage(d:int):
    change_hp(d)
    
func heal(d:int):
    change_hp(d)
