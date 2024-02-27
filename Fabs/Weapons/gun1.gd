extends Area2D


func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const bullet = preload("res://Fabs/Weapons/Bullets/bullet.tscn")
	var new_bullt = bullet.instantiate()
	new_bullt.global_position = %ShootingPoint.global_position
	new_bullt.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullt)


func _on_timer_timeout():
	shoot()
