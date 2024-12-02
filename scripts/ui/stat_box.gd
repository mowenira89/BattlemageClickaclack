class_name StatBox extends VBoxContainer

@onready var up: TextureButton = $Up
@onready var down: TextureButton = $Down
@onready var label: Label = $ColorRect2/Label
@onready var amount: Label = $ColorRect/Amount

var num:int

@export var stat:String
var temp_up:int

func _ready():
    up.disabled=true
    down.disabled=true
    label.text = stat
    set_arrows()
    
func set_stat(s:int):
    num = s
    set_num()
    
func set_num():
    amount.text = str(num)
    
func disable_up():
    up.disabled=true
    
func enable_up():
    up.disabled=false
    
func disable_down():
    down.disabled=true
    
func enable_down():
    down.disabled=false

func _on_up_pressed() -> void:
    temp_change_amount(1)

func _on_down_pressed() -> void:
    temp_change_amount(-1)
    
func temp_change_amount(d:int):
    temp_up+=d
    num+=d
    set_stat(num)
    Signals.temp_stats.emit(d*-1)
    set_arrows()

func set_arrows():
    if temp_up>0:
        enable_down()
    else: disable_down()
    var points_available = get_parent().points_available
    if points_available>0:enable_up()
    else: disable_up()

func update_stat():
    Signals.update_stat.emit([stat,num])
