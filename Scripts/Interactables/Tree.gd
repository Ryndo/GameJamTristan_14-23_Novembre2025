class_name TreeBase extends Hoverable

@export var _healthBarUI : ProgressBar
@export var _log_spawn_position : Node3D
@export var _woodType : String
@export var hoverTimer : Timer
@export var _health : int

func _ready() :
	_healthBarUI.max_value = _health
	_healthBarUI.value = _health
	hoverTimer.timeout.connect(_healthBarUI.hide)
	_healthBarUI.hide()
	
func Hitted(damage):
	_health -= damage
	_healthBarUI.value = _health
	
	if _health <= 0 :
		KillTree()

func HoverAction():
	_healthBarUI.show()
	
func UnHoverAction():
	hoverTimer.start()
	


func KillTree() :
	DropLogs()
	get_parent().queue_free()

func DropLogs():
	ObjectSpawner.spawnLog(_log_spawn_position.global_position,_woodType)
	ObjectSpawner.spawnLog(_log_spawn_position.global_position,_woodType)
	ObjectSpawner.spawnLog(_log_spawn_position.global_position,_woodType)
	pass
