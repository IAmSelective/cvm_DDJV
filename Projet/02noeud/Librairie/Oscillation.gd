extends Node2D

var new_angle := 0.1
@export var angle_amplitude := 0.1
@export var angle_periode := 1

#Pour ajouter un peu plus de variations entre tous les gazons
var random_angle_amplitude := 0.04
var random_angle_periode := 0.02
var variation_angle_amplitude := 0.0
var variation_angle_periode := 0.0

@export var node_to_affect : Node2D

func _ready() -> void:
    variation_angle_amplitude = randf_range(-random_angle_amplitude, random_angle_amplitude)
    variation_angle_periode = randf_range(-random_angle_periode, random_angle_periode)
    

func _process(_delta: float) -> void:
    var temps_courant_seconde = Time.get_ticks_msec() / 1000.0
    new_angle = (angle_amplitude+variation_angle_amplitude) * sin(2*PI * temps_courant_seconde / (angle_periode + variation_angle_periode))
    node_to_affect.rotation = new_angle