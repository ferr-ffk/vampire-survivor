extends Node2D

func _ready():
	spawn_mobs(5)

func _on_timer_timeout():
	spawn_mobs(4)
	
func spawn_mob():
	var mob = preload("res://assets/mobs/slime/slime.tscn").instantiate()
	
	# pega um ponto aleatório na reta
	%PathFollow2D.progress_ratio = randf()
	
	mob.global_position = %PathFollow2D.global_position
	
	%Mobs.add_child(mob)

func spawn_mobs(qtd):
	for numero in qtd:
		spawn_mob()

func _on_player_vida_zerada():
	%GameOverScreen.visible = true
	
	get_tree().paused = true



func _on_play_again_button_pressed():
	pass
