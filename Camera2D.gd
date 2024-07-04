extends Camera2D

@export var target_path: NodePath # مسار عقدة اللاعب
@export var lerp_speed: float = 5.0  # سرعة متابعة الكاميرا

@onready var target: Node2D = get_node_or_null(target_path)

func _process(delta):
	if target:
		global_position = global_position.lerp(target.global_position, lerp_speed * delta)
