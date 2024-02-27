extends Node2D

func _ready():
	spawn_mob()

func spawn_mob():
	var mob = preload("res://Fabs/Mobs/Slime1.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)


func _on_timer_timeout():
	spawn_mob()
