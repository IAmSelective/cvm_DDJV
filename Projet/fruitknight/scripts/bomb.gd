extends Node2D

const EXPLOSION_SIZE := Vector2(0.7, 0.7)
@onready var sprite : AnimatedSprite2D = $Sprite

var is_active : bool = false
var exploded : bool = false
func _ready():
    sprite.play("Spawning")
    sprite.animation_finished.connect( 
        func() : 
            if !is_active and !exploded :
                sprite.play("Idle")
                is_active = true
            elif is_active and exploded :
                queue_free()

    )

func explode():
    exploded = true
    scale = EXPLOSION_SIZE
    sprite.play("Explosion")

func _on_knight_entered(area:Area2D) -> void:
    var knight = area.get_parent().get_parent() as Knight
    if knight and is_active:
        explode()
        knight.die()
