extends CharacterBody2D

signal vida_zerada

@export var vida = Game.player_hp

const VELOCIDADE = 500
@onready var character = %HappyBoo

func _physics_process(delta):
	# necessário para definir os botões de movimento
	# obtem as strings definidas no input map do projeto
	# retorna o vetor de direção (x positivo, y positivo, etc)
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * VELOCIDADE
	
	move_and_slide()

func _process(delta):
	if velocity.length() > 0.0:
		character.play_walk_animation()
	else:
		character.play_idle_animation()
			
	var mobs_em_alcance = %HurtBox.get_overlapping_bodies()
	
	# ERRO RESOLVIDO:
	# o area2d reconhecia o proprio player como um mob, e então tomava dano
	# para isso tem que aumentar a area de colisão do hurtbox
	# e colocar os mobs em uma collision layer diferente da do player
	if mobs_em_alcance.size() > 0:
		vida -= Game.slime_dano * mobs_em_alcance.size() * delta
		%HealthBar.value = vida
	
	if vida <= 0.0:
		vida_zerada.emit()
		
