extends VBoxContainer

@onready var inv_container: MarginContainer = $MarginContainer
@onready var inv: VBoxContainer = $MarginContainer/PanelContainer/ScrollContainer/VBoxContainer
@onready var panel = preload("res://scenes/ui/inv_slot.tscn")

var inventory:Array[Item] = []



func _on_button_pressed() -> void:
    inv_container.visible = !inv_container.visible
    if inv_container.visible:set_inventory()

func add_item(i:Item):
    for x in range(0,inventory.size()):
        if i.data.item_name==inventory[x].data.item_name:
            inventory[x].quantity+=i.quantity
            return true
    inventory.append(i)
            
func remove_item(i:Item,quantity:int):
    var index = inventory.find(i)
    if index!=null:
        if inventory[index].quantity-quantity<=0:
            inventory[index].quantity-=quantity
            if inventory[index].quantity==0:
                inventory.erase(i)
                
func set_inventory():
    for x in inv.get_children():
        x.queue_free()
    for x in inventory:
        var slot = panel.instantiate()
        slot.set_slot(x)        
       
