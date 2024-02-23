extends CharacterBody2D

const VELOCIDADE = 500
var character

func _ready():
	character = %HappyBoo
	character.play_idle_animation()
	
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

func _process(delta):
	pass
