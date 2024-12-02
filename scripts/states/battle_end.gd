class_name BattleEnd extends State

func enter():
    BattleManager.obtain_gold()
    Signals.enemy_defeated.emit()
