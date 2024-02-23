extends CharacterBody2D

signal vida_zerada

var vida = 100.0
const DANO_POR_SEGUNDO = 8.0

const VELOCIDADE = 500
@onready var character = %HappyBoo

func _physics_process(delta):
	# necessário para definir os botões de movimento
	# obtem as strings definidas no input map do projeto
	# retorna o vetor de direção (x positivo, y positivo, etc)
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * VELOCIDADE
	
	move_and_slide()
	
	if velocity.length() > 0.0:
		character.play_walk_animation()
	else:
		character.play_idle_animation()
			
	var mobs_em_alcance = %HurtBox.get_overlapping_bodies()
	
	if mobs_em_alcance.size() > 0:
		vida -= DANO_POR_SEGUNDO * mobs_em_alcance.size() * delta
		%HealthBar.value = vida
	
	if vida <= 0.0:
		vida_zerada.emit()

func _process(delta):
	pass
