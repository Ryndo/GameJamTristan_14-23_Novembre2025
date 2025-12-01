extends UI_Menu

var opened = false
@export var _sensitivitySlider : HSlider

func _ready():
	super()
	CustomSignals.OpenOptionMenu.connect(OpenMenu)
	
func OpenMenu() :
	super()
	UpdateSliderValue()
	

	
func UpdateSliderValue() :
	_sensitivitySlider.value = GameData.MouseSensitivity
	
func ChangeSensitivity(value_changed):
	GameData.MouseSensitivity = value_changed
