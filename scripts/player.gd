extends Node

var data:PlayerData

func _ready():
	Signals.start_new.connect(create_player)

func set_player(p:PlayerData):
	data=p

func create_player(s:PlayerData):
	data=s
	
