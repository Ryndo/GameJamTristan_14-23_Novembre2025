extends Control

@export var _nameColumn : Array[Label]
@export var _amountColumn : Array[Label]
@export var _xColumn : Array[Label]
@export var _priceColumn : Array[Label]
@export var _totalColumn : Array[Label]

@export var _playerMoney : Label
@export var _saleTotal : Label

func _ready() :
	CustomSignals.OpenPickUpMenu.connect(OpenMenu)
	
func OpenMenu() :
	HideColumns()
	LoadInventory()
	_playerMoney.text = str(PlayerInventory.Money)
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func CloseMenu() :
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()
	
func LoadInventory():
	var totalAmount = 0

	for i in range(PlayerInventory.Logs.size()) :
		var woodData = Wood_Data.GetWoodData(PlayerInventory.Logs[i].LogName)
		_nameColumn[i].show()
		_amountColumn[i].show()
		_priceColumn[i].show()
		_totalColumn[i].show()
		
		_nameColumn[i].text = woodData.Name
		_amountColumn[i].text = str(PlayerInventory.Logs[i].Amount)
		_priceColumn[i].text = str(woodData.Price)
		_totalColumn[i].text = str(woodData.Price * PlayerInventory.Logs[i].Amount)
		totalAmount += PlayerInventory.Logs[i].Amount * PlayerInventory.Logs[i].Amount
	_saleTotal.text = str(totalAmount)

func Sell() :
	var totalAmount = 0
	for wood in PlayerInventory.Logs :
		var woodData = Wood_Data.GetWoodData(wood.LogName)
		totalAmount += woodData.Price * wood.Amount
		
	PlayerInventory.AddMoney(totalAmount)
	PlayerInventory.ClearLogInventory()
	_playerMoney.text = str(PlayerInventory.Money)
	CloseMenu()

func HideColumns() :
	for i in range(_nameColumn.size()) :
		_nameColumn[i].hide()
		_amountColumn[i].hide()
		_xColumn[i].hide()
		_priceColumn[i].hide()
		_totalColumn[i].hide()
		
