extends Area2D  # أو  KinematicBody2D  إذا  كنت  تريد  فيزياء  أكثر  دقة

@export var speed = -300  # سرعة  الرصاصة

func _physics_process(delta):
	position += transform.y * speed * delta  # تحريك  الرصاصة  للأمام

func _on_area_entered(area):  # يتم  استدعاء  هذه  الدالة  عند  ملامسة  منطقة  تصادم  أخرى
	if area.is_in_group("enemies"):  # تحقق  مما  إذا  كانت  منطقة  التصادم  تابعة  للأعداء
		
		# قم  بإلحاق  الضرر  بالعدو  هنا
		queue_free()  # حذف  الرصاصة

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()  # حذف  الرصاصة  عند  خروجها  من  الشاشة 


func _on_body_entered(_body):
	queue_free()
	pass # Replace with function body.
