class_name UpgradeCategory extends Node

@export var Upgrades : Array[Upgrade]

var CurrentTier : int = 1
var _maxTier = 1
var IsMaxed = false

func _ready() :
	SetMaxTier()
	
func GetCurrentUpgradeTier() :
	for upgrade in Upgrades :
		if upgrade.Tier == CurrentTier :
			return upgrade
	return 

func IncreaseTier() :
	if CurrentTier >= _maxTier :
		IsMaxed = true
	else :
		CurrentTier += 1
		
	
func SetMaxTier() :
	for upgrade in Upgrades :
		_maxTier = max(upgrade.Tier,_maxTier)
