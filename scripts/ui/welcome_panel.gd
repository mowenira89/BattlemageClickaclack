class_name WelcomePanel extends Panel
@onready var start: Button = $Start
@onready var species: HBoxContainer = $HBoxContainer
@onready var stat_picker: StatPicker = $StatPicker
@onready var options: VBoxContainer = $Options


func _ready():
    Signals.show_menu.connect(show_menu)
    Signals.hide_menu.connect(hide_menu)

func _on_start_pressed() -> void:
    options.visible=false
    species.visible=true
    

func show_menu():
    reset_panel()
    visible=true

func hide_menu():
    visible=false

func _on_elf_pressed() -> void:
    Signals.start_new.emit(load("res://resources/elf.tres").duplicate())
    new_game()

func _on_dwarf_pressed() -> void:
    Signals.start_new.emit(load("res://resources/dwarf.tres").duplicate())
    new_game()

func new_game():
    species.visible=false
    stat_picker.visible=true
    stat_picker.request_stats()
    stat_picker.change_points_available(2)

func reset_panel():
    stat_picker.visible=false
    species.visible=false
    options.visible=true


func _on_load_pressed() -> void:
    Signals.load_game.emit(0)
    visible=false
