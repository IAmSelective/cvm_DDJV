extends Node2D

@export var vitesse := 10
@export var grosseur_min := 0.5
@export var grosseur_max := 2.5

func _draw() -> void:
    var taille := randf_range(grosseur_min, grosseur_max)
    scale = Vector2(taille, taille)

func _process(delta: float) -> void:
    position.x = position.x + vitesse * delta