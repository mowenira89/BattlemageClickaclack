class_name MenuState extends State


func enter():
    Signals.show_menu.emit()
    Signals.start_new_game.connect(new_game_connect)

func exit():
    Signals.hide_menu.emit()
    Signals.start_new_game.disconnect(new_game_connect)

func new_game_connect():
    get_parent().switch_state('start')
