extends Marker2D
class_name Gun

@onready var timer = %FireRate

@export var dano: float
@export var fireRate: float

@export var shootingPoint: Marker2D
@export var camera: Camera2D
@export var sprite: Sprite2D

var posicao_mouse = null

func _ready():
	timer.wait_time = fireRate
	%Sprite.texture = sprite
	
func _process(delta):
	if Input.is_action_pressed("shoot") and timer.is_stopped():
		shoot()

func _physics_process(delta):
	posicao_mouse = get_global_mouse_position()
	self.look_at(posicao_mouse)

func shoot():
	# cria um node de bala e adiciona ao marker 'ShootingPoint' do cano da arma
	var bala = preload("res://entities/weapons/bullets/bullet.tscn").instantiate()
	
	bala.global_position = shootingPoint.global_position
	bala.global_rotation = shootingPoint.global_rotation
	bala.dano = self.dano
	
	shootingPoint.add_child(bala)
	timer.start()
