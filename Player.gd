extends CharacterBody2D

@export var moveVelocity = 600

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * moveVelocity
	move_and_slide()
	
	if(velocity.length() > 0.0):
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()	