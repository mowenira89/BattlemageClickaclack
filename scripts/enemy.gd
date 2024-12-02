class_name Enemy extends Node2D
@onready var sprite: TextureButton = $Sprite2D

@onready var anim: AnimationPlayer = $AnimationPlayer

var data:EnemyData

const path = "res://resources/enemies/"

var enemies = {}

func _ready():
    Signals.get_next_enemy.connect(create_enemy)
    Signals.enemy_defeated.connect(defeat)
    BattleManager.enemy=self
    fill_enemies_dict()


func fill_enemies_dict():
    var dir = DirAccess.open(path)
    if dir:
        dir.list_dir_begin()
        var filename = dir.get_next()
        while filename!="":
            
            var data:EnemyData = load(path+filename)
            if !enemies.has(data.level):
                enemies[data.level]={}
            if !data.boss:
                enemies[data.level][data.data_name]=data.rarity
            else:
                enemies['level_'+str(data.level)+'_boss']=data.data_name
            
            filename=dir.get_next()

func get_next_enemy(level:int):
    var total = 0
    for i in enemies[level]:
        total+=enemies[level][i]
    var enemy_list = []
    for i in enemies[level]:
        enemy_list.append(i)
    while total>0:
        var enemy = enemy_list.pop_at(randi()%enemy_list.size())
        total-=enemies[level][enemy]
        if total<=0:return enemy


func create_enemy(level:int):
    var data_name = get_next_enemy(level)
    data = load("res://resources/Enemies/"+data_name+".tres").duplicate()
    sprite.texture_normal = data.image
    sprite.position=Vector2(-194.5,-112)
    visible=true
    anim.play("enter")
    Signals.set_enemy_health.emit(data)
    Signals.send_message.emit(data.flavor_text)
    
func set_enemy(e:EnemyData):
    data = e
    sprite.texture_normal=data.image
    anim.play("enter")

func _on_sprite_2d_pressed() -> void:
    Signals.enemy_clicked.emit()
   
func defeat():
    anim.play('defeat')
