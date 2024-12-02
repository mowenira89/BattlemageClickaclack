class_name MessageContainer extends VBoxContainer

var message = preload("res://scenes/ui/message.tscn")

func _ready():
    Signals.send_message.connect(display_message)
    
func display_message(s:String):
    var m = message.instantiate()
    add_child(m)
    m.create_message(s)
