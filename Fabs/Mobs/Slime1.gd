extends CharacterBody2D

@export var moveVelocity = 300
@export var health = 5

var playerTarget

func _ready():
	playerTarget = get_node("/root/Game/Player")
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(playerTarget.global_position)
	velocity = direction * moveVelocity
	move_and_slide()


func take_damage():
	health-= 1
	
	%Slime.play_hurt()
	
	if health <= 0:
		queue_free()
