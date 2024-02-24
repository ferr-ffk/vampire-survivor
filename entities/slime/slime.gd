extends CharacterBody2D

@export var health = 25.0

@onready var character = %Slime
@onready var player = $"../../Player"

const VELOCIDADE = 300.0

func _ready():
	pass

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)

	velocity = direction * VELOCIDADE
	
	move_and_slide()

func take_damage(dano: int):
	health -= dano
	
	if health <= 0:
		var explosao = preload("res://scenes/common/explosion/smoke_explosion.tscn").instantiate()
		
		get_parent().add_child(explosao)
		explosao.global_position = global_position
		
		queue_free()
	
	character.play_hurt()
