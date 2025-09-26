extends Node2D

var Projectile := preload("res://Projectile.tscn")  #Pour preparer une scène de chat

@export var velocite_epaule := 2.0
@export var velocite_bras := 3.0

@onready var epaule = $Epaule #onready pour assurer que le asset est loadé
@onready var bras = $Epaule/Bras
@onready var main = $Epaule/Bras/Main

func _process(delta: float) -> void:
    var deplacement_bras := velocite_bras * delta
    var deplacement_epaule := velocite_epaule * delta
    if Input.is_action_pressed('ui_right'):
        epaule.rotation += deplacement_epaule
    if Input.is_action_pressed('ui_left'):
        epaule.rotation -= deplacement_epaule
    if Input.is_action_pressed('ui_up'):
        bras.rotation -= deplacement_bras
    if Input.is_action_pressed('ui_down'):
        bras.rotation += deplacement_bras

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept"):
        
        var my_projectile := Projectile.instantiate()
        my_projectile.global_position = main.global_position
        get_parent().add_child(my_projectile)   #Ajouter en dernier (bonne pratique)