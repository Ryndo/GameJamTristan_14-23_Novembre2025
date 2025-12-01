class_name UI_Menu extends Control

var isOpened = false
func _ready():
	CloseMenu()
	
func OpenMenu() :
	isOpened = true
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	UIMenuManager.currentMenuOpened = self
	
func CloseMenu() :
	isOpened = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()
	UIMenuManager.currentMenuOpened = null
	
func OpenCloseMenu() :
	if isOpened :
		CloseMenu()
	else :
		OpenMenu()
