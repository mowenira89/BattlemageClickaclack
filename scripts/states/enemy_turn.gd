class_name EnemyTurn extends State



func enter():
    Signals.move_enemy.emit()
