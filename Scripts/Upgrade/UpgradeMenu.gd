extends Control

@export var _playerMoney : Label

@export var AxeUISlot : UpgradeUISlot
@export var AxeUpgrades : UpgradeCategory

@export var MaxStaminaUISlot : UpgradeUISlot
@export var MaxStaminaUpgrades : UpgradeCategory

@export var StaminaEfficiencyUISlot : UpgradeUISlot
@export var  StaminaEfficiencyUpgrades : UpgradeCategory

@export var InventoryUISlot : UpgradeUISlot
@export var InventoryUpgrades : UpgradeCategory

@export var RunningSpeedUISlot : UpgradeUISlot
@export var RunningSpeedUpgrades : UpgradeCategory

func _ready() :
	CustomSignals.OpenUpgradeMenu.connect(OpenMenu)
	PlayerInventory.MoneyUpdate.connect(RefreshMoneyUI)
	CloseMenu()

func OpenMenu() :
	_playerMoney.text = str(PlayerInventory.Money)
	FillUISlots()
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func CloseMenu() :
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()


func FillUISlots() :
	RefreshUpgradeSlot(AxeUISlot,AxeUpgrades)
	RefreshUpgradeSlot(MaxStaminaUISlot,MaxStaminaUpgrades)
	RefreshUpgradeSlot(StaminaEfficiencyUISlot,StaminaEfficiencyUpgrades)
	RefreshUpgradeSlot(InventoryUISlot,InventoryUpgrades)
	RefreshUpgradeSlot(RunningSpeedUISlot,RunningSpeedUpgrades)
	
func RefreshUpgradeSlot(slot : UpgradeUISlot, upgradeCategory : UpgradeCategory) :
	if upgradeCategory.IsMaxed :
		slot.SoldOut()
	else : 
		slot.DisplayUpgradeCurrentTier(upgradeCategory.GetCurrentUpgradeTier())

func BuyAxeUpgrade() :
	BuyUpgrade(AxeUpgrades)
	RefreshUpgradeSlot(AxeUISlot,AxeUpgrades)

		
func BuyMaxStaminaUpgrade() :
	BuyUpgrade(MaxStaminaUpgrades)
	RefreshUpgradeSlot(MaxStaminaUISlot,MaxStaminaUpgrades)

		
func BuyStaminaEfficiencyUpgrade() :
	BuyUpgrade(StaminaEfficiencyUpgrades)
	RefreshUpgradeSlot(StaminaEfficiencyUISlot,StaminaEfficiencyUpgrades)
		
func BuyInventoryUpgrade() :
	BuyUpgrade(InventoryUpgrades)
	RefreshUpgradeSlot(InventoryUISlot,InventoryUpgrades)
		
func BuyRunningSpeedUpgrade() :
	BuyUpgrade(RunningSpeedUpgrades)
	RefreshUpgradeSlot(RunningSpeedUISlot,RunningSpeedUpgrades)
		
	
func BuyUpgrade(upgradeCategory : UpgradeCategory) :
	var upgrade : Upgrade = upgradeCategory.GetCurrentUpgradeTier()
	if PlayerInventory.Money >= upgrade.Cost :
		upgrade.ApplyEffect()
		upgradeCategory.IncreaseTier()
		PlayerInventory.SubstractMoney(upgrade.Cost)
		
func RefreshMoneyUI(value) :
	_playerMoney.text = str(value)
