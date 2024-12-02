class_name InvSlot extends Panel

var item:Item
@onready var item_label: Label = $MarginContainer/Item
@onready var quantity_label: Label = $MarginContainer/Quantity
@onready var use: Button = $OptionPanel/VBoxContainer/Use

func set_slot(i:Item):
    item=i
    item_label.text=item.data.item_name
    if item.data.item_type==ItemData.types.Melee or item.data.item_type==ItemData.types.Wand:
        use.text="EQUIP"



func _on_use_pressed() -> void:
        match item.data.item_type:
            ItemData.types.Melee:
                Signals.melee_selected.emit(item)                
                return
            ItemData.types.Wand:
                Signals.wand_selected.emit(item)
                return
        item.use(BattleManager.player.data,BattleManager.enemy.data)
