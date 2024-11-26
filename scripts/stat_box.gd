class_name StatBox extends VBoxContainer

@onready var up: TextureButton = $Up
@onready var down: TextureButton = $Down
@onready var label: Label = $ColorRect2/Label
@onready var hp_box: StatBox = $"."
@onready var mp_box: StatBox = $"../MPBox"
@onready var melee_box: StatBox = $"../MeleeBox"
@onready var magic_box: StatBox = $"../MagicBox"
@onready var def_box: StatBox = $"../DefBox"
@onready var mag_def: StatBox = $"../MagDef"
@onready var speed: StatBox = $"../Speed"
@onready var mp_regen: StatBox = $"../MPRegen"

var num:int

@export var stat:String

func _ready():
	up.disabled=true
	down.disabled=true
	label.text = stat
	
func set_stats(s:Array[int]):
	var stats = [hp_box,mp_box,melee_box,magic_box,def_box,mag_def,speed,mp_regen] 
	for x in range(0,s.size()-1):
		stats[x]=s[x]
