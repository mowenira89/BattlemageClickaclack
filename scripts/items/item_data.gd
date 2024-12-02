class_name ItemData extends Resource

enum types {Melee,Wand,Loot,Helm,Armor,Boot}

@export var image:Texture2D
@export var item_name:String
@export var item_type:types
@export var accuracy:int
@export var unmissable:bool
@export var effect:Array[Effect]
@export_multiline var flavor_text:String
@export var mp_cost:int
@export var throw_effect:Array[Effect]
