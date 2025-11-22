class_name WoodDatas extends Node


@export var LogsType : Array[WoodType]


	
func GetWoodData(name) :
	for wood in LogsType :
		if wood.Name == name :
			return wood
	return null
