extends Area2D

@onready var sprite = $AnimatedSprite2D

var playerInRange = false

func _on_body_entered(_body):
	print("Estas en el rango de interaccion")
	playerInRange = true

func _on_body_exited(_body):
	print("Saliste del rango de interaccion")
	playerInRange = false

func _process(_delta):
	if playerInRange and Input.is_action_just_pressed("E"):  # O "interact" si lo tienes en Input Map
		print("¡Interacción activada!")
		sprite.queue_free()  # Esto elimina el sprite del objeto
