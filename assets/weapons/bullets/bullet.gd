extends Area2D

const VELOCIDADE = 1200.0
const ALCANCE = 1000
var distancia = 0

func _physics_process(delta):
	# obtem a rotação do area2d que automaticamente segue o mob
	var direction = Vector2.RIGHT.rotated(self.rotation)
	
	# como o area2d não possui move_and_slide(), temos que usar o delta explicitamente
	position += direction * VELOCIDADE * delta

	distancia += VELOCIDADE * delta
	
	if distancia >= ALCANCE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	
	if body.has_method("take_damage"):
		body.take_damage()
		
