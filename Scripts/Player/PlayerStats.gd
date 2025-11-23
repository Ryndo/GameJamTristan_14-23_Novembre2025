extends Node

var MaxStamina = 100
var CurrentStamina
var StaminaSprintCost = 5 #per second
var StaminaSwingCost

var WalkingSpeed = 4
var RunningSpeed = 8


func _ready() :
	CurrentStamina = MaxStamina

	
func DecreaseStamina(value) :
	CurrentStamina -= value
