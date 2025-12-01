class_name Axe extends Node3D

@export var _animationPlayer : AnimationPlayer
@export var _hitbox : Area3D

func _ready():
	DeactivateHitbox()

func Swing() :
	if _animationPlayer.is_playing() :
		return
	if PlayerStats.CurrentStamina >= PlayerStats.StaminaSwingCost :
		_animationPlayer.play("Swing")
	else:
		_animationPlayer.play("SwingSlow")

func ActivateHitbox() :
	_hitbox.monitoring = true

func DeactivateHitbox() :
	_hitbox.monitoring = false

func consumeSwingStamina() :
	PlayerStats.CurrentStamina -= PlayerStats.StaminaSwingCost

func _on_hit_box_body_entered(body):
	body.Hitted(AxeData.damage)
