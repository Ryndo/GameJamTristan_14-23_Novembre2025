class_name TreeBase extends Hoverable

@export var _healthBarUI : ProgressBar
@export var _log_spawn_position : Node3D
@export var _woodType : String

var _health = 10
func _ready() :
	_healthBarUI.value = _health
func Hitted():
	_health -= 10
	_healthBarUI.value = _health
	
	if _health <= 0 :
		KillTree()

func HoverAction():
	_healthBarUI.show()

func UnHoverAction():
	_healthBarUI.hide()


func KillTree() :
	DropLogs()
	get_parent().queue_free()

func DropLogs():
	ObjectSpawner.spawnLog(_log_spawn_position.position,_woodType)
	ObjectSpawner.spawnLog(_log_spawn_position.position,_woodType)
	ObjectSpawner.spawnLog(_log_spawn_position.position,_woodType)
	pass
