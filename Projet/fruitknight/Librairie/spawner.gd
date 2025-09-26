class_name Spawner
extends Node2D

#Passer la zone ou spawner

@export var scene : PackedScene
@export var spawn_time : float = 2.0
@onready var timer : Timer = $Timer
@onready var parent : Node2D = get_parent()

func _ready():
    timer.wait_time = spawn_time


func _on_spawn() -> void:
    var spawn : Node2D = scene.instantiate()
    var pos_rect : Rect2 = parent.get_viewport().get_visible_rect().grow(-20)
    spawn.position = self._get_random_position_in_frame(pos_rect)
    parent.add_child(spawn)

func _get_random_position_in_frame(rect : Rect2) -> Vector2:
    var x = randf_range(rect.position.x, rect.end.x)
    var y = randf_range(rect.position.y, rect.end.y)
    return Vector2(x, y)

func stop():
    timer.stop()
