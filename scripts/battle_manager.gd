extends Node

var player:Player
var enemy:Enemy
var equipped_weapon:Item

var turns:Array[Entity] = []

func _ready():
    Signals.move_enemy.connect(move_enemy)

func attack_enemy():    
    equipped_weapon.use(player.data,enemy.data)
    check_next(player.data)

func accuracy_check(a:Entity, t:Entity, i)->bool:
    if i.unmissable:
        return true
    var r = randi()%t.evasion
    var accuracy = (a.accuracy+i.accuracy)/2
    if r<accuracy:
        return true
    else: return false
    
func move_enemy():
    var move = enemy.data.moves.pick_random()
    if accuracy_check(enemy.data,player.data,move):    
        move.use(enemy.data,player.data)
    check_next(enemy.data)
    
func check_next(mover:Entity):
    if enemy.data.hp<=0:
        Signals.switch_state.emit('end')
    else:
        var next=""
        if mover==turns[0]:
            next = 'enemy_turn' if player.data==turns[0] else 'player_turn'
        else: next='between_turns'
        Signals.switch_state.emit(next)
        
func obtain_gold():
    player.data.gold+=enemy.data.gold
