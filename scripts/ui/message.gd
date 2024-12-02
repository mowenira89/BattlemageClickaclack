class_name Message extends Control
@onready var label: RichTextLabel = $Panel/MarginContainer/Label
@onready var anim: AnimationPlayer = $AnimationPlayer

var messages = []

func _ready() -> void:
    Signals.send_message.connect(create_message)
    Signals.enemy_defeated.connect(close)

func create_message(s:String):
    messages.append(s)
    if !visible:
        display_message()

func display_message():
    visible=true
    label.text=messages.pop_at(0)

func _on_gui_input(event: InputEvent) -> void:
    if event.is_action_pressed("click"):
        if messages!=[]:
            display_message()
        else:
            visible=false
            
func close():
    visible=false
    messages = []
