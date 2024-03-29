extends CharacterBody2D

signal health_depleted

@export var moveVelocity = 600
@export var health = 100.0
@export var damage_rate = 5.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * moveVelocity
	move_and_slide()
	
	if(velocity.length() > 0.0):
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()	
		
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * delta
		
		%ProgressBar.value = health
		
		if health <= 0.0:
			health_depleted.emit()
