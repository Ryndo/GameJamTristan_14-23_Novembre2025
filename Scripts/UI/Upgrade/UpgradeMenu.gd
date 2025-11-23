extends Control

@export var _playerMoney : Label

@export var AxeUISlot : UpgradeUISlot
@export var AxeUpgrades : Array[Upgrade]

@export var MaxStaminaUISlot : UpgradeUISlot
@export var MaxStaminaUpgrades : Array[Upgrade]

@export var StaminaEfficiencyUISlot : UpgradeUISlot
@export var  StaminaEfficiencyUpgrades : Array[Upgrade]

@export var InventoryUISlot : UpgradeUISlot
@export var InventoryUpgrades : Array[Upgrade]

@export var RunningSpeedUISlot : UpgradeUISlot
@export var RunningSpeedUpgrades : Array[Upgrade]

func _ready() :
	CustomSignals.OpenUpgradeMenu.connect(OpenMenu)
	
func _process(delta):
	_playerMoney.text = str(PlayerInventory.Money)
	
func OpenMenu() :
	_playerMoney.text = str(PlayerInventory.Money)
	FillUISlots()
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func CloseMenu() :
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()


func FillUISlots() :
	AxeUISlot.DisplayUpgradeCurrentTier(AxeUpgrades[ShopData.AxeUpgradeCurrentTier])
	MaxStaminaUISlot.DisplayUpgradeCurrentTier(MaxStaminaUpgrades[ShopData.MaxStaminaUpgradeCurrentTier])
	StaminaEfficiencyUISlot.DisplayUpgradeCurrentTier(StaminaEfficiencyUpgrades[ShopData.StaminaEfficiencyUpgradeCurrentTier])
	InventoryUISlot.DisplayUpgradeCurrentTier(InventoryUpgrades[ShopData.InventoryUpgradeCurrentTier])
	RunningSpeedUISlot.DisplayUpgradeCurrentTier(RunningSpeedUpgrades[ShopData.RunningSpeedUpgradeCurrentTier])

func FillAxeUpgradeSlot() :
	if AxeUpgrades.size() > ShopData.AxeUpgradeCurrentTier :
		AxeUISlot.DisplayUpgradeCurrentTier(AxeUpgrades[ShopData.AxeUpgradeCurrentTier])
	else : 
		AxeUISlot.SoldOut(AxeUpgrades[AxeUpgrades.size()-1])
		
func FillMaxStaminaUpgradeSlot() :
	if MaxStaminaUpgrades.size() > ShopData.MaxStaminaUpgradeCurrentTier :
		MaxStaminaUISlot.DisplayUpgradeCurrentTier(MaxStaminaUpgrades[ShopData.MaxStaminaUpgradeCurrentTier])
	else : 
		MaxStaminaUISlot.SoldOut(MaxStaminaUpgrades[MaxStaminaUpgrades.size()-1])

func FillStaminaEfficiencyUpgradeSlot() :
	if StaminaEfficiencyUpgrades.size() > ShopData.StaminaEfficiencyUpgradeCurrentTier :
		StaminaEfficiencyUISlot.DisplayUpgradeCurrentTier(StaminaEfficiencyUpgrades[ShopData.StaminaEfficiencyUpgradeCurrentTier])
	else :
		StaminaEfficiencyUISlot.SoldOut(StaminaEfficiencyUpgrades[StaminaEfficiencyUpgrades.size()-1])

func FillInventoryUpgradeSlot() :
	if InventoryUpgrades.size() > ShopData.InventoryUpgradeCurrentTier :
		InventoryUISlot.DisplayUpgradeCurrentTier(InventoryUpgrades[ShopData.InventoryUpgradeCurrentTier])
	else : 
		InventoryUISlot.SoldOut(InventoryUpgrades[InventoryUpgrades.size()-1])

func FillRunningSpeedUpgradeSlot() :
	if RunningSpeedUpgrades.size() > ShopData.RunningSpeedUpgradeCurrentTier :
		RunningSpeedUISlot.DisplayUpgradeCurrentTier(RunningSpeedUpgrades[ShopData.RunningSpeedUpgradeCurrentTier])
	else : 
		InventoryUISlot.SoldOut(RunningSpeedUpgrades[RunningSpeedUpgrades.size()-1])



func BuyAxeUpgrade() :
	if PlayerInventory.Money >= AxeUpgrades[ShopData.AxeUpgradeCurrentTier].Cost :
		AxeUpgrades[ShopData.AxeUpgradeCurrentTier].ApplyEffect()
		PlayerInventory.SubstractMoney(AxeUpgrades[ShopData.AxeUpgradeCurrentTier].Cost)
		ShopData.AxeUpgradeCurrentTier += 1
		_playerMoney.text = str(PlayerInventory.Money)
		FillAxeUpgradeSlot()
		
func BuyMaxStaminaUpgrade() :
	if PlayerInventory.Money >= MaxStaminaUpgrades[ShopData.MaxStaminaUpgradeCurrentTier].Cost :
		MaxStaminaUpgrades[ShopData.MaxStaminaUpgradeCurrentTier].ApplyEffect()
		PlayerInventory.SubstractMoney(MaxStaminaUpgrades[ShopData.MaxStaminaUpgradeCurrentTier].Cost)
		ShopData.MaxStaminaUpgradeCurrentTier += 1
		_playerMoney.text = str(PlayerInventory.Money)
		FillMaxStaminaUpgradeSlot()
		
func BuyStaminaEfficiencyUpgrade() :
	if PlayerInventory.Money >= StaminaEfficiencyUpgrades[ShopData.StaminaEfficiencyUpgradeCurrentTier].Cost :
		StaminaEfficiencyUpgrades[ShopData.StaminaEfficiencyUpgradeCurrentTier].ApplyEffect()
		PlayerInventory.SubstractMoney(StaminaEfficiencyUpgrades[ShopData.StaminaEfficiencyUpgradeCurrentTier].Cost)
		ShopData.StaminaEfficiencyUpgradeCurrentTier += 1
		_playerMoney.text = str(PlayerInventory.Money)
		FillStaminaEfficiencyUpgradeSlot()
		
func BuyInventoryUpgrade() :
	if PlayerInventory.Money >= InventoryUpgrades[ShopData.InventoryUpgradeCurrentTier].Cost :
		InventoryUpgrades[ShopData.InventoryUpgradeCurrentTier].ApplyEffect()
		PlayerInventory.SubstractMoney(InventoryUpgrades[ShopData.InventoryUpgradeCurrentTier].Cost)
		ShopData.InventoryUpgradeCurrentTier += 1
		_playerMoney.text = str(PlayerInventory.Money)
		FillInventoryUpgradeSlot()
		
func BuyRunningSpeedUpgrade() :
	if PlayerInventory.Money >= RunningSpeedUpgrades[ShopData.RunningSpeedUpgradeCurrentTier].Cost :
		RunningSpeedUpgrades[ShopData.RunningSpeedUpgradeCurrentTier].ApplyEffect()
		PlayerInventory.SubstractMoney(RunningSpeedUpgrades[ShopData.RunningSpeedUpgradeCurrentTier].Cost)
		ShopData.RunningSpeedUpgradeCurrentTier += 1
		_playerMoney.text = str(PlayerInventory.Money)
		FillRunningSpeedUpgradeSlot()
		
	
		
