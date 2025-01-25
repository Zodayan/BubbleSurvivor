extends Area2D
class_name Projectile

var vitesse: float = 200
var direction: Vector2 = Vector2(1, 0)
var penetration: int = 1
var arme_associee = Weapon

func _on_area_entered(area: Area2D) -> void:
	# Si on touche un ennemi, on lui inflige des dégats
	if penetration > 0:
		var ennemi_touche: Enemy = area
		ennemi_touche.deal_damage(arme_associee.degats)
		penetration -= 1

	# Si le projectile n'a plus de pénétration en réserve, c'est qu'il a touché le nb max d'ennemis,
	#il est donc détruit
	if penetration == 0:
		queue_free()

func _process(delta: float) -> void:
	position.x += direction.normalized().x * delta * vitesse
	position.y += direction.normalized().y * delta * vitesse
