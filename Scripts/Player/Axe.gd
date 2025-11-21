class_name Axe extends Node3D

@export var _animationPlayer : AnimationPlayer
@export var _hitbox : Area3D

@export var _staminaSwingCost : int
func _ready():
	DeactivateHitbox()

func Swing() :
	if PlayerStats.CurrentStamina >= _staminaSwingCost :
		_animationPlayer.play("Swing")

func ActivateHitbox() :
	_hitbox.monitoring = true

func DeactivateHitbox() :
	_hitbox.monitoring = false


func consumeSwingStamina() :
	PlayerStats.CurrentStamina -= _staminaSwingCost
