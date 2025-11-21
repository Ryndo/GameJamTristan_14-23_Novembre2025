class_name Log extends Interactable

@export var _text : Sprite3D
# Called when the node enters the scene tree for the first time.
func _ready():
	_text.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_text.global_position = global_position
	_text.global_position.y += 1.5

func HoverAction():
	_text.show()

func UnHoverAction():
	_text.hide()

func Interact():
	PlayerInventory.Logs += 1
	get_parent().queue_free()
