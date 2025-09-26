class_name Character
extends Node2D

@export var speed : float = 225

@onready var sprite : AnimatedSprite2D = $Sprite

func _ready():
	pass

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_released('ui_right'):
		sprite.play('Idle_R')
	elif event.is_action_released('ui_left'):
		sprite.play('Idle_L')
	elif event.is_action_released('ui_up'):
		sprite.play('Idle_U')
	elif event.is_action_released('ui_down'):
		sprite.play('Idle_D')

func  _process(delta : float):
	var move_value := speed * delta
	if Input.is_action_pressed('ui_right'):
		sprite.play('Walk_R')
		position.x += move_value
	elif Input.is_action_pressed('ui_left'):
		sprite.play('Walk_L')
		position.x -= move_value
	elif Input.is_action_pressed('ui_up'):
		sprite.play('Walk_U')
		position.y -= move_value
	elif Input.is_action_pressed('ui_down'):
		sprite.play('Walk_D')
		position.y += move_value
