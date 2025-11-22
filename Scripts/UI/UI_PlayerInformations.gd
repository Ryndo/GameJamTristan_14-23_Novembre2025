extends Node

@export var _logStock : ProgressBar
@export var _stamina : ProgressBar

func _ready() :
	_logStock.max_value = PlayerInventory.LogMaxCapacity
	_stamina.max_value = PlayerStats.MaxStamina
	
func _process(delta):
	UpdateInventory()
	UpdateStats()

func UpdateInventory() :
	_logStock.value = PlayerInventory.LogCurrentCapacity
	
func UpdateStats() :
	_stamina.value = PlayerStats.CurrentStamina
