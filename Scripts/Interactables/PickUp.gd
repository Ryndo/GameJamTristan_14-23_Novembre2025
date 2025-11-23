extends Interactable

@export var _interactText : Label
func Interact():
	CustomSignals.OpenSaleMenu.emit()

func HoverAction():
	_interactText.show()

func UnHoverAction():
	_interactText.hide()
