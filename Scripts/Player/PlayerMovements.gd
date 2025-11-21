class_name PlayerMovements extends CharacterBody3D

@export var _head : Node3D
@export var _camera : Node3D
@export_range(0,1,.01) var _sensitivity = .02
@export var _walkSpeed : float
@export var _sprintSpeed : float
@export var _jumpForce : float


var inputs : Vector3
var mouseMouvement : Vector2 = Vector2.ZERO
var speed
var _isSprinting
var _bobFrequency = 1.3
var _bobAmplitude = .06
var _tBob = 0

var cameraRotation

func _ready() :
	cameraRotation = _camera.rotation

func _process(delta) :
	_head.rotate_y(-mouseMouvement.x * _sensitivity)
	_camera.rotate_x(mouseMouvement.y * _sensitivity)
	_camera.rotation.x = clamp(_camera.rotation.x, deg_to_rad(-40),deg_to_rad(60))
	_camera.rotation.y = cameraRotation.y
	_camera.rotation.z = cameraRotation.z
	_head.rotation.x = clamp(_head.rotation.x, deg_to_rad(-40),deg_to_rad(60))
	_head.rotation.z = 0
	mouseMouvement = Vector2.ZERO

func _physics_process(delta):
	
	if is_on_floor() :	
		_tBob += delta * velocity.length()
		_camera.transform.origin = HeadBobbin(_tBob)
	if !is_on_floor() :
		velocity.y += get_gravity().y * delta
		
	CalculateMovement(delta)
	
	move_and_slide()


func CalculateMovement(delta) :
	if Inputkeys.Sprint.isPressed :
		_isSprinting = true
		speed = _sprintSpeed
	else :
		_isSprinting = false
		speed = _walkSpeed 
	
	var direction = (_head.transform.basis * Vector3(inputs.x,0,inputs.z)).normalized()
	if is_on_floor() :
		if direction :
			velocity.x =  speed * direction.x
			velocity.z =  speed * direction.z
			if _isSprinting :
				ConsumeSprintStamina()
		else : 
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7)
	else :
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3)
		
	
			
	if Inputkeys.Jump.isPressed and is_on_floor():
		velocity.y = _jumpForce
	if Inputkeys.Jump.hasBeenReleased and !is_on_floor():
		Inputkeys.Jump.hasBeenReleased = false
		velocity.y *= 0.5
		
func ConsumeSprintStamina() :
	PlayerStats.DecreaseStamina(PlayerStats.StaminaSprintCost * get_process_delta_time())

			
func HeadBobbin(time) :
	var pos = Vector3.ZERO
	pos.y = sin(time * _bobFrequency) * _bobAmplitude
	pos.x = sin(time * _bobFrequency / 2) * _bobAmplitude
	return pos
