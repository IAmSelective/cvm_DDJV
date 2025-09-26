extends Button
const taquineries := ["Haha t'es poche", "Oupsiii", "Lente comme Daronne", "Pourrrrriiii"]
const padding := -100.0

@onready var recolor := preload("res://won_btn.tres")

func _ready() -> void:
    mouse_entered.connect(_activate)
    position = get_viewport().get_visible_rect().get_center()

func _activate():
    var rect := get_viewport().get_visible_rect().grow(padding)
    
    var x := randf_range(rect.position.x, rect.end.x)
    var y := randf_range(rect.position.y, rect.end.y)
    text = taquineries[randi_range(0, 3)]
    position = Vector2(x, y)

func _trap_me(_area:Area2D):
    text = "Au secours!"
    disconnect("mouse_entered", _activate)
    pressed.connect(_win)
    

func _win():
    text = "Bravo!"
    add_theme_stylebox_override("normal", recolor)
    
    