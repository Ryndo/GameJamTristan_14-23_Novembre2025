class_name Axe extends Node3D

@export var _animationPlayer : AnimationPlayer
@export var _hitbox : Area3D

func _ready():
	DeactivateHitbox()

func Swing() :
	_animationPlayer.play("Swing")

func ActivateHitbox() :
	_hitbox.monitoring = true

func DeactivateHitbox() :
	_hitbox.monitoring = false
