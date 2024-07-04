extends CharacterBody2D

@export var move_speed = 250
@export var rotate_speed = 2
@export var joystick_threshold = 0.1  
@export var bullet_scene: PackedScene 

func _physics_process(delta):
	# تأكد من أن أسماء العقد هنا تطابق أسماء العقد في شجرة المشهد
	var joystick_move_direction = $UI/Joystick.get_velo()
	var joystick_rotate_direction = $UI/Joystick_Rotate.get_velo()

	# طباعة القيم للتحقق من صحة القيم المسترجعة
	print("Move Direction: ", joystick_move_direction)
	print("Rotate Direction: ", joystick_rotate_direction)

	# توقف اللاعب عن الحركة حتى يتم تحريك عصا التحكم بشكل كافٍ
	if joystick_move_direction.length() > joystick_threshold:
		velocity = joystick_move_direction.normalized() * move_speed
	else:
		velocity = Vector2.ZERO

	# قم بتحديث اتجاه دوران اللاعب بناءً على عصا التحكم الدورانية
	if joystick_rotate_direction.length() > joystick_threshold:
		var target_angle = atan2(joystick_rotate_direction.y, joystick_rotate_direction.x)
		rotation = lerp_angle(rotation, target_angle, rotate_speed * delta)
	
	move_and_slide() 

func _on_shooter_pressed():
	shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position 
	bullet.global_rotation = global_rotation 
	get_tree().root.add_child(bullet) 
