extends Area2D


func _physics_process(delta):
	var inimigos = get_overlapping_bodies()
	
	if inimigos.size() > 0:
		# seleciona o inimigo mais perto
		var inimigo_em_alvo = inimigos.front()
		
		look_at(inimigo_em_alvo.global_position)

func shoot():
	# cria um node de bala e adiciona ao marker 'ShootingPoint' do cano da arma
	const BALA_CENA = preload("res://assets/weapons/bullets/bullet.tscn")
	
	var bala = BALA_CENA.instantiate()
	
	bala.global_position = %ShootingPoint.global_position
	bala.global_rotation = %ShootingPoint.global_rotation
	
	%ShootingPoint.add_child(bala)


func _on_timer_timeout():
	shoot()
