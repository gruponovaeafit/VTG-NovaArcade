extends Area2D

func _on_body_entered(_body):
	print("+1 coin")
	queue_free()