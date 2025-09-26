class_name Bat
extends AnimatedSprite2D

@onready var life_bar : LifeBar = get_parent().find_child("LifeBar")
var is_alive : bool = true


func _ready() -> void:
    animation_finished.connect( func() : if is_alive :play("Vol"))

func _unhandled_key_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_focus_next"):
        if is_alive:
            play("Die")
        else:
            play_backwards("Die")
        is_alive = not is_alive

func _process(delta: float) -> void:  #delta = temps depuis le dernier frame
    var velocite := 225.0
    var deplacement := velocite * delta
    if Input.is_action_pressed('ui_right'):
        position.x += deplacement
        flip_h = false
    if Input.is_action_pressed('ui_left'):
        position.x -= deplacement
        flip_h = true
    if Input.is_action_pressed('ui_up'):
        position.y -= deplacement
    if Input.is_action_pressed('ui_down'):
        position.y += deplacement


func _on_collectable_touch(area:Area2D) -> void:
    var collectable : Collectable = area.get_parent()
    if collectable:
        play("Attack")
        life_bar.gain_life(1)
