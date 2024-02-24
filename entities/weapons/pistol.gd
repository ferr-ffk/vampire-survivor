extends Area2D

@export var dano = Game.pistol_dano

var posicao_mouse = null

@onready var timer = %FireRate

func _process(delta):
	if Input.is_action_pressed("shoot") and timer.is_stopped():
		shoot()

func _physics_process(delta):
	posicao_mouse = get_global_mouse_position()
	look_at(posicao_mouse)

func shoot():
	# cria um node de bala e adiciona ao marker 'ShootingPoint' do cano da arma
	var bala = preload("res://entities/weapons/bullets/bullet.tscn").instantiate()
	
	bala.global_position = %ShootingPoint.global_position
	bala.global_rotation = %ShootingPoint.global_rotation
	
	%ShootingPoint.add_child(bala)
	timer.start()
