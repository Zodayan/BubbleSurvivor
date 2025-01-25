extends Area2D
class_name Projectile

var vitesse: float = 1
var direction: Vector2 = Vector2(1, 0)
var penetration: int = 1
var arme_associee = Weapon

static func creerProjectile(arme: Weapon) -> void:
	print("creerProjectile")

func _on_body_enter(body: Node2D) -> void:
	
	# Si on touche un ennemi, on lui inflige des dégats
	if body.is_class("Enemy"):
		var ennemi_touche: Enemy = body
		ennemi_touche.deal_damage(arme_associee.degats)
		penetration -= 1

	# Si le projectile n'a plus de pénétration en réserve, c'est qu'il a touché le nb max d'ennemis,
	#il est donc détruit
	if penetration == 0:
		queue_free()
