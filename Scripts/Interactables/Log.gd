class_name Log extends Interactable

@export var _text : Sprite3D
@export var _woodType : String
# Called when the node enters the scene tree for the first time.
func _ready():
	_text.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_text.global_position = global_position
	_text.global_position.y += 1.5



func PickUp() :
	if (PlayerInventory.AddLog(_woodType,1)) :
		get_parent().queue_free()
