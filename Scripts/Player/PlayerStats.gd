extends Node

var MaxStamina = 100
var CurrentStamina
var StaminaSprintCost = 5 #per second
var StaminaSwingCost

func _ready() :
	CurrentStamina = MaxStamina

	
func DecreaseStamina(value) :
	CurrentStamina -= value
