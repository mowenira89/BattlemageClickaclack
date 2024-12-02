class_name EquipUI extends VBoxContainer

var loot_inv=[]
var melee_inv=[]
var wand_inv=[]
var spells=[]
var helm_inv=[]
var armor_inv=[]
var boot_inv=[]

var slot_ref = preload("res://scenes/ui/inv_slot.tscn")
@onready var melee_sprite: TextureRect = $"HBoxContainer/Melee Weapon/MeleeSprite"
@onready var magic_sprite: TextureRect = $HBoxContainer/MagicWeapon/MagicSprite
@onready var equip_inv: VBoxContainer = $Inv/ScrollContainer/GridContainer
@onready var inv: Panel = $Inv
@onready var magic_weapon: NinePatchRect = $HBoxContainer/MagicWeapon
@onready var melee_weapon: NinePatchRect = $"HBoxContainer/Melee Weapon"
@onready var inv_button: Button = $HBoxContainer/InvButton

var equipped_melee:Item
var equipped_wand:Item

func _ready():
    Signals.start_new_game.connect(new_game)
    Signals.melee_selected.connect(set_melee_slot)
    Signals.wand_selected.connect(set_wand_slot)
    Signals.add_item.connect(add_item)
    Signals.remove_item.connect(remove_item)

func new_game():
    var sword = Item.new()
    sword.create_item('pointy_stick',1)
    var rod = Item.new()
    rod.create_item('magic_wand',1)
    melee_inv.append(sword)
    wand_inv.append(rod)
    equipped_melee = sword
    equipped_wand = rod
    set_melee_slot(sword)
    set_wand_slot(rod)
    BattleManager.equipped_weapon=equipped_melee
    melee_weapon.self_modulate = "#30ff007b"

func set_melee_slot(i:Item):
    equipped_melee=i
    melee_sprite.texture = equipped_melee.data.image
    
    
func set_wand_slot(i:Item):
    equipped_wand=i
    magic_sprite.texture = equipped_wand.data.image


func clear_inv_screen():
    var children = equip_inv.get_children()
    for x in children:
        x.queue_free()

func set_melee_inv():
    clear_inv_screen()
    for x in melee_inv:
        var slot = slot_ref.instantiate()
        equip_inv.add_child(slot)
        slot.set_slot(x)
    
func set_wand_inv():
    clear_inv_screen()
    for x in wand_inv:
        var slot = slot_ref.instantiate()
        equip_inv.add_child(slot)
        slot.set_slot(x)
        
        
func set_loot_inv():
    clear_inv_screen()
    for x in loot_inv:
        var slot = slot_ref.instantiate()
        equip_inv.add_child(slot)
        slot.set_slot(x)
        
func set_helm_inv():
    clear_inv_screen()
    for x in helm_inv:
        var slot = slot_ref.instantiate()
        equip_inv.add_child(slot)
        slot.set_slot(x)
        
        
func set_armor_inv():
    clear_inv_screen()
    for x in armor_inv:
        var slot = slot_ref.instantiate()
        equip_inv.add_child(slot)
        slot.set_slot(x)
        
        
func set_boot_inv():
    clear_inv_screen()
    for x in boot_inv:
        var slot = slot_ref.instantiate()
        equip_inv.add_child(slot)
        slot.set_slot(x)
        
                
        
func _on_melee_weapon_gui_input(event: InputEvent) -> void:
    if event.is_action_pressed("right click"):
        inv.visible = !inv.visible
        if inv.visible:
            set_melee_inv()
    if event.is_action_pressed("click"):
        BattleManager.equipped_weapon=equipped_melee
        unselect()
        melee_weapon.self_modulate = "#30ff007b"

func _on_magic_weapon_gui_input(event: InputEvent) -> void:
    if event.is_action_pressed("right click"):
        inv.visible = !inv.visible
        if inv.visible:
            set_wand_inv()
    if event.is_action_pressed("click"):
        BattleManager.equipped_weapon=equipped_wand
        unselect()
        magic_weapon.self_modulate = "#30ff007b"
        
func unselect():
    magic_weapon.self_modulate="#ffffff72"
    melee_weapon.self_modulate="#ffffff72"


func add_item(i:Item):
    var inventory=get_inv(i)
    for x in range(0,inventory.size()):
        if i.data.item_name==inventory[x].data.item_name:
            inventory[x].quantity+=i.quantity
            return true
    inventory.append(i)
            
func remove_item(i:Item,quantity:int):
    var inventory = get_inv(i)
    var index = inventory.find(i)
    if index!=null:
        if inventory[index].quantity-quantity<=0:
            inventory[index].quantity-=quantity
            if inventory[index].quantity==0:
                inventory.erase(i)

func get_inv(i:Item):
    match i.data.item_type:
        ItemData.types.Melee:
            return melee_inv
        ItemData.types.Wand:
            return wand_inv
        ItemData.types.Helm:
            return helm_inv
        ItemData.types.Armor:
            return armor_inv
        ItemData.types.Boot:
            return boot_inv
        ItemData.types.Loot:
            return loot_inv
