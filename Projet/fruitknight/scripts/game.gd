extends Node2D

const FRUIT_NUMBER = 12
var total_score = 0

@onready var knight: Knight = find_child("Knight")
@onready var fruit_scene : PackedScene = preload("res://scenes/Fruit.tscn")
@onready var score_label : Label = find_child("Score").get_child(0)
@onready var timer : Timer =  find_child("FruitTimer")
@onready var frame : Rect2 = get_viewport().get_visible_rect().grow(-20)
@onready var bomb_spawner : Spawner = $BombSpawner


func _ready() -> void:
    create_fruit()
    knight.dieSignal.connect(stop_game)

func create_fruit() -> void:
    var fruit : Node2D = fruit_scene.instantiate()
    fruit.get_child(0).frame = randi_range(0, FRUIT_NUMBER-1)
    fruit.position = _get_random_position_in_frame(frame)
    add_child(fruit)

func add_score(score : int) -> void:
    total_score += score
    score_label.text = "Score : %d" % [total_score]
    knight.accelerate()

func stop_game() -> void:
    timer.stop()
    bomb_spawner.stop()

func _get_random_position_in_frame(rect : Rect2) -> Vector2:
    var x = randf_range(rect.position.x, rect.end.x)
    var y = randf_range(rect.position.y, rect.end.y)
    return Vector2(x, y) 