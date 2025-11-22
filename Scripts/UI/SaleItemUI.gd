class_name SaleItemUI extends Node

@export var Name : Label
@export var Amount : Label
@export var SinglePrice : Label
@export var Total : Label


func FillLine(woodData : WoodType,amount) :
	Name.text = woodData.Name
	Amount.text = str(amount)
	SinglePrice.text = str(woodData.Price)
	Total.text = str(amount * woodData.Price)
