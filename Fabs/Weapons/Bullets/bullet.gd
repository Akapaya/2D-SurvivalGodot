extends Area2D

@export var velocitySpeed = 800
@export var maxRange = 1200
var travelled_distance = 0

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * velocitySpeed * delta
	
	travelled_distance += velocitySpeed * delta
	
	if travelled_distance >= maxRange:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
