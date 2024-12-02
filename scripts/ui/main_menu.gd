class_name MainMenu extends Panel

func _on_resume_pressed() -> void:
    visible=false


func _on_save_pressed() -> void:
    Signals.save_game.emit(0)
    visible=false
    


func _on_load_pressed() -> void:
    Signals.load_game.emit(0)
    visible=false

func _input(event: InputEvent) -> void:
    if event.is_action_pressed('esc'):
        visible = !visible
