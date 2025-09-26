extends Node2D

@onready var button := $BoutonInfernal
const taquineries := ["Haha t'es poche", "Oupsiii", "Lente comme Daronne", "Pourrrrriiii"]
const padding := -100.0

func _ready() -> void:
    button.mouse_entered.connect(func() -> void: activate())
    button.position = get_viewport().get_visible_rect().get_center()

func activate():
    var rect := get_viewport().get_visible_rect().grow(padding)
    
    var x := randf_range(rect.position.x, rect.end.x)
    var y := randf_range(rect.position.y, rect.end.y)
    button.text = taquineries[randi_range(0, 3)]
    button.position = Vector2(x, y)