extends Area2D

@onready var big_circle = $BigCircle
@onready var small_circle = $BigCircle/SmallCircle
@onready var max_distance = $CollisionShape2D.shape.radius
var touched = false

func _ready():
	pass
	#لا حاجة لربط إشارة هنا 

func _gui_input(event):
	if event is InputEventScreenTouch:
		var distance = event.position.distance_to(big_circle.global_position)
		if not touched and distance < max_distance:
			touched = true
			event.set_input_as_handled()
		else:
			small_circle.position = Vector2(0, 0)
			touched = false

func _process(_delta):
	if touched:
		small_circle.global_position = get_global_mouse_position()
		var direction = (small_circle.position - big_circle.position)
		if direction.length() > max_distance:
			direction = direction.normalized() * max_distance
		small_circle.position = big_circle.position + direction

func get_velo():
	var joy_velo = Vector2(0, 0)
	joy_velo.x = small_circle.position.x / max_distance
	joy_velo.y = small_circle.position.y / max_distance
	return joy_velo
