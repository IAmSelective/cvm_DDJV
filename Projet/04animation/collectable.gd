class_name Collectable
extends Sprite2D


func _ready() -> void:
	frame = randi_range(0,8)

func _on_bat_entered(area:Area2D) -> void:
	var bat = area.get_parent() as Bat
	var timer = get_tree().create_timer(0.2) #Start a timer handled by the tree  
	if bat:
		timer.connect("timeout", queue_free) #Connect it  
		
