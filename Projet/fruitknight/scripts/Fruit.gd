class_name Fruit
extends Node2D


func _on_knight_touch(area:Area2D) -> void:
	var knight = area.get_parent().get_parent() as Knight
	if knight:
		get_parent().add_score(1)
		queue_free()
	
