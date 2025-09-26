extends Node2D

@onready var start_btn := $BoutonDemarrer

func _ready() -> void:
    start_btn.pressed.connect(func(): get_tree().change_scene_to_file("res://MiniJeuInfernal.tscn"))

func _quit() -> void:
    get_tree().quit()

