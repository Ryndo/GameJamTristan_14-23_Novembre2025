extends Node

var Logs : Array[InventoryElement]
var LogCurrentCapacity = 0
var LogMaxCapacity = 10

var Money = 0


func AddLog(wood : String, amount : int) :
	LogCurrentCapacity += amount
	for log in Logs :
		if log.LogName == wood :
			log.Amount += amount
			return
	Logs.append(InventoryElement.new(wood,amount))

func ClearLogInventory() :
	Logs.clear()
	LogCurrentCapacity = 0

func AddMoney(amount : int) :
	Money += amount

func SubstractMoney(amount : int) :
	Money -= amount
