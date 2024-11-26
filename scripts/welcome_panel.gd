extends Panel
@onready var start: Button = $Start
@onready var species: HBoxContainer = $HBoxContainer



func _on_start_pressed() -> void:
	start.visible=false
	species.visible=true
	
	


func _on_elf_pressed() -> void:
	Signals.start_new.emit(load("res://resources/elf.tres").duplicate())
	


func _on_dwarf_pressed() -> void:
	Signals.start_new.emit(load("res://resources/dwarf.tres").duplicate())
	
