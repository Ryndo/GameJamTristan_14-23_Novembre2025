extends Interactable

@export var _interactText : Label

func _ready():
	_interactText.hide()

func Interact():
	CustomSignals.OpenCloseSaleMenu.emit()

func HoverAction():
	_interactText.show()

func UnHoverAction():
	_interactText.hide()
