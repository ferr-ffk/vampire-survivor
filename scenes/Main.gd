extends Node2D

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()

func _on_timer_timeout():
	spawn_mobs(3)
	
func spawn_mob():
	var mob = preload("res://assets/mobs/slime/slime.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf()
	
	mob.global_position = %PathFollow2D.global_position
	
	%Mobs.add_child(mob)

func spawn_mobs(qtd):
	for numero in qtd:
		spawn_mob()

func _on_player_vida_zerada():
	%GameOverScreen.visible = true
	
	get_tree().paused = true
