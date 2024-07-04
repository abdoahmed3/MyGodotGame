extends TextureButton

var joystick_radius = 25
var base_position = Vector2()
var touch_position = Vector2()
var is_touching = false
var direction = Vector2()

func _ready():
	base_position = position

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			is_touching = true
		else:
			is_touching = false
			position = base_position
	elif event is InputEventScreenDrag:
		if is_touching:
			touch_position = event.position - global_position
			# تأكد من أن  touch_position  لا تتجاوز نصف قطر الجويستيك
		if touch_position.length() > joystick_radius:
				touch_position = touch_position.normalized() * joystick_radius
				position = base_position + touch_position

func _process(delta):
	if is_touching:
		direction = touch_position / joystick_radius
	else:
		direction = Vector2()

	print("Joystick Direction: ", direction)

func get_direction():
	return direction
