extends CharacterBody2D

var health = 3

const VELOCIDADE = 300.0

@onready var character = %Slime
@onready var player = get_node("/root/Game/Player")

func _ready():
	character.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)

	velocity = direction * VELOCIDADE
	
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		const EXPLOSAO_CENA = preload("res://smoke_explosion/smoke_explosion.tscn")
		
		var explosao = EXPLOSAO_CENA.instantiate()
		
		get_parent().add_child(explosao)
		explosao.global_position = global_position
		
		queue_free()
	
	character.play_hurt()
