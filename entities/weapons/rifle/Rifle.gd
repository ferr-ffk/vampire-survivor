extends Node2D
class_name Rifle

@export var dano = Game.rifle_dano

func shoot():
	# cria um node de bala e adiciona ao marker 'ShootingPoint' do cano da arma
	var bala = preload("res://entities/weapons/bullets/bullet.tscn").instantiate()
	
	bala.global_position = $Gun/WeaponPivot.global_position
	bala.global_rotation = $Gun/WeaponPivot.global_rotation
	bala.dano = self.dano
	
	$Gun/WeaponPivot.add_child(bala)

func _on_gun_shoot_pressed():
	shoot()
