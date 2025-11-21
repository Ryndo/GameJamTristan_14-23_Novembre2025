extends Node

var LogObject = preload("res://Prefabs/log.tscn")

func spawnLog(position : Vector3) :
	var log_instance = LogObject.instantiate()
	add_child(log_instance)
	var x = randf_range(0, TAU)
	var y = randf_range(0, TAU)
	var z = randf_range(0, TAU)
	var rotation = Vector3(x, y, z)
	log_instance.rotation = rotation
	log_instance.position = position
