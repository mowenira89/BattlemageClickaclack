class_name MessagePanel extends Panel
@onready var label: RichTextLabel = $MarginContainer/RichTextLabel
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

func _ready():
    timer.start(4)

func _on_timer_timeout() -> void:
    anim.play('fade')

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
    if anim_name=='fade':
        queue_free()
