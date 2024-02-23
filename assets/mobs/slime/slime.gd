extends CharacterBody2D

const VELOCIDADE = 300.0

@onready var character = %Slime
@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)

	velocity = direction * VELOCIDADE
	
	move_and_slide()
