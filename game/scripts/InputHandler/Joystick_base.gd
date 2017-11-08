extends Node

var button_sensitivity = 0.3
var stick_sensitivity = 0.3
var movement = Vector2()

var button_up    = JOY_DPAD_UP
var button_left  = JOY_DPAD_LEFT
var button_down  = JOY_DPAD_DOWN
var button_right = JOY_DPAD_RIGHT
var axis_x       #=
var axis_y       #=

var move_up    = false
var move_left  = false
var move_down  = false
var move_right = false

var move_axis_x = 0.0
var move_axis_y = 0.0

func _ready():
	set_process_input(true)

func _input(event):
	if (event.type == InputEvent.JOYSTICK_BUTTON and not event.is_echo()):
		var pressed = event.is_pressed()
		if (event.button_index == button_up):
			move_up = pressed
		elif (event.button_index == button_left):
			move_left = pressed
		elif (event.button_index == button_down):
			move_down = pressed
		elif (event.button_index == button_right):
			move_right = pressed
	
	movement = Vector2()
	if move_up:    movement.y += button_sensitivity
	if move_down:  movement.y -= button_sensitivity
	if move_left:  movement.x -= button_sensitivity
	if move_right: movement.x += button_sensitivity


func _get_movement():
	return movement
