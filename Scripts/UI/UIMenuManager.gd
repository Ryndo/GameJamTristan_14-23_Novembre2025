extends Node

var currentMenuOpened : UI_Menu


func OpenCloseMenus() :
	if currentMenuOpened == null :
		CustomSignals.OpenOptionMenu.emit()
	
	else :
		currentMenuOpened.CloseMenu()
		currentMenuOpened = null
