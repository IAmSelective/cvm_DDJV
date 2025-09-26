class_name Knight
extends Node2D

@onready var sprite : AnimatedSprite2D = $Sprite

@export var speed : float = 200.0
var direction_x : float
var direction_y : float
var is_alive : bool = true

signal dieSignal

func _ready() -> void:
	stop_moving()
	center()
	sprite.play("Idle")
	sprite.animation_finished.connect( func() : if !is_alive :stop_moving())

func _unhandled_key_input(event: InputEvent) -> void:
	if !is_alive:
		return
	if event.is_action_pressed('ui_right'):
		sprite.play("Walk_Right")
		direction_x = 1.0
		direction_y = 0.0
	elif event.is_action_pressed('ui_left'):
		sprite.play("Walk_Left")
		direction_x = -1.0
		direction_y = 0.0
	elif event.is_action_pressed('ui_up'):
		sprite.play("Walk_Up")
		direction_y = -1.0
		direction_x = 0.0
	elif event.is_action_pressed('ui_down'):
		sprite.play("Walk_Down")
		direction_y = 1.0
		direction_x = 0.0

func center() -> void:
	position = get_viewport().get_visible_rect().get_center()

func die() -> void:
	is_alive = false
	direction_x = -direction_x
	direction_y = -direction_y
	sprite.play("Die")
	speed = 150.0
	dieSignal.emit()

func _process(delta: float) -> void:  #delta = temps depuis le dernier frame
	var velocity : float = speed * delta
	position.x += velocity * direction_x
	position.y += velocity * direction_y

func _on_exit_screen() -> void:
	die()

func stop_moving() -> void:
	direction_x = 0.0
	direction_y = 0.0

func accelerate() -> void:
	speed += speed/40
