extends Node


func spawnLog(position : Vector3, name) :
	var woodData = Wood_Data.GetWoodData(name)
	var log_instance = woodData.LogModel.instantiate()
	add_child(log_instance)
	var x = randf_range(0, TAU)
	var y = randf_range(0, TAU)
	var z = randf_range(0, TAU)
	var rotation = Vector3(x, y, z)
	log_instance.rotation = rotation
	log_instance.global_position = position
