class_name UpgradeUISlot extends Node

@export var Name : Label
@export var NameDescription : Label
@export var Effect : Label
@export var Cost : Label
@export var buyButton : Button
@export var Upgrades : Array[Upgrade]
var upgrade : Upgrade

func DisplayUpgradeCurrentTier(upgradeData : Upgrade) :
	Name.text = upgradeData.Name
	NameDescription.text = upgradeData.NameDescription
	Effect.text = upgradeData.Effect
	Cost.text = str(upgradeData.Cost)
	upgrade = upgradeData
	
func SoldOut(maxTierUpgrade) :
	DisplayUpgradeCurrentTier(maxTierUpgrade)
	buyButton.hide()
