class_name Message_Container extends VBoxContainer

const message_panel = preload("res://scenes/ui/message_panel.tscn")

func _ready():
    Signals.send_message.connect(create_message)
    
func create_message(s:String):
    var message = message_panel.instantiate()
    add_child(message)
    message.label.text=s
    
