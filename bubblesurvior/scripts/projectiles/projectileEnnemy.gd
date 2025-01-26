extends Projectile
class_name ProjectileEnnemy

var degats : float = 10

func _on_area_entered(area: Area2D) -> void:
	
	queue_free()
	
	
func _on_body_entered(body: Node2D) -> void:
	# Si on détecte une collision avec le joueur, on active le mode "dégats au joueur",
	#qui va faire des dégats au joueur toutes les secondes
	print("collide")
	
	if body.is_class("CharacterBody2D"):
		body.dealDamage(degats)
	
	queue_free()
