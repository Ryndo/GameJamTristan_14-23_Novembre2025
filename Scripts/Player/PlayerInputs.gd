class_name Player extends Node

@export var movements : PlayerMovements
@export_group("Camera")
@export_range(0,1) var mouse_sensitivity = .25
@export var Camera : Node3D
var cameraInputDirection := Vector2.ZERO
var inputVector:Vector3 = Vector3.ZERO

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	cameraInputDirection = Vector2.ZERO
	CalculateInputVector()
	movements.inputs = inputVector
	
	
func CalculateInputVector() :
	inputVector = Vector3.ZERO
	if Inputkeys.Forward.isPressed :
		inputVector.z += 1
	if Inputkeys.Backward.isPressed :
		inputVector.z -= 1
	if Inputkeys.Left.isPressed :
		inputVector.x += 1
	if Inputkeys.Right.isPressed :
		inputVector.x -= 1
	if Inputkeys.Jump.isPressed :
		inputVector.y = 1


func _unhandled_input(event):
	if event is InputEventMouseMotion  :
		cameraInputDirection = event.screen_relative
		movements.mouseMouvement = cameraInputDirection
	else : 
		movements.mouseMouvement = Vector2.ZERO
	Inputkeys.Jump.Reset()
	KeyRegistering(event)


func KeyRegistering(event : InputEvent) :
	if event.is_action_pressed("MoveForward") :
		Inputkeys.Forward.isPressed = true
	if event.is_action_pressed("MoveBackward") :
		Inputkeys.Backward.isPressed = true
	if event.is_action_pressed("MoveRight") :
		Inputkeys.Right.isPressed = true
	if event.is_action_pressed("MoveLeft") :
		Inputkeys.Left.isPressed = true
		
	if event.is_action_released("MoveForward") :
		Inputkeys.Forward.isPressed = false
		Inputkeys.Forward.hasBeenReleased = true
	if event.is_action_released("MoveBackward") :
		Inputkeys.Backward.isPressed = false
		Inputkeys.Backward.hasBeenReleased = true
	if event.is_action_released("MoveRight") :
		Inputkeys.Right.isPressed = false
		Inputkeys.Right.hasBeenReleased = true
	if event.is_action_released("MoveLeft") :
		Inputkeys.Left.isPressed = false
		Inputkeys.Left.hasBeenReleased = true


	if event.is_action_pressed("Jump") :
		Inputkeys.Jump.isPressed = true
	if event.is_action_released("Jump") :
		Inputkeys.Jump.isPressed = false
		Inputkeys.Jump.hasBeenReleased = true
		
	if event.is_action_pressed("Sprint") :
		Inputkeys.Sprint.isPressed = true
	if event.is_action_released("Sprint") :
		Inputkeys.Sprint.isPressed = false
		Inputkeys.Sprint.hasBeenReleased = true
		
		
		
