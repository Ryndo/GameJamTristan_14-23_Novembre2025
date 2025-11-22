extends Interactable

func Interact():
	CustomSignals.OpenPickUpMenu.emit()
	
