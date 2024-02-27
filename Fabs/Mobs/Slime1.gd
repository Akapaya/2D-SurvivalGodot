extends CharacterBody2D

@export var moveVelocity = 300

var playerTarget

func _ready():
	playerTarget = get_node("/root/Game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(playerTarget.global_position)
	velocity = direction * moveVelocity
	move_and_slide()
