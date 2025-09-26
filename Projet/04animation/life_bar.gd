class_name LifeBar
extends Sprite2D

# func _process(_delta: float) -> void:
#     if Input.is_action_just_pressed('ui_accept'):
#         if frame > 0:
#             frame -= 1

func gain_life(value:int = 1):
    if frame > 0:
        #var timer = get_tree().create_timer(0.2)
        await get_tree().create_timer(0.2).timeout
        frame -= value
        #timer.connect("timeout", func(): frame -= value)
