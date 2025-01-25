extends Area2D
class_name Enemy

const DELAI_DEGATS = 1 #delais de 1s pour infliger à nouveau des dégats au joueur
var vitesse: float = 10
var pv_max: float = 10
var pv: float = pv_max
var degats: float = 5
var direction: Vector2 = Vector2(1, 0)
var is_collision_joueur: bool = false
var timer_collision: float = 0
var player_body: BubblePlayer
	
func _process(delta: float) -> void:
	
	gerer_deplacement(delta)
	
	gerer_collision_joueur(delta)
	
func gerer_deplacement(delta: float) -> void:
	# Par défaut les ennemis vont tout droit vers le joueur
	direction = Vector2(CustomSceneTree.getInstance()._playerManager.pos - position)
	
	position.x += vitesse * delta * direction.normalized()[0]
	position.y += vitesse * delta * direction.normalized()[1]
	
func gerer_collision_joueur(delta: float) -> void:
	# Si le joueur est en collision avec cet ennemi et que ca fait plus d'une seconde que le joueur a subi des
	#dégats avec cet ennemi, alors le joueur prendre des dégats
	if is_collision_joueur:
		if timer_collision >= DELAI_DEGATS:
			player_body.dealDamage(degats)
			print("player hit")
			timer_collision -= DELAI_DEGATS
		else:
			timer_collision += delta

# Se déclenche quand le joueur rentre en collision avec la collision de ce sprite
func _on_body_entered(body: Node2D) -> void:
	# Si on détecte une collision avec le joueur, on active le mode "dégats au joueur",
	#qui va faire des dégats au joueur toutes les secondes
	if body.is_class("CharacterBody2D"):
		is_collision_joueur = true
		timer_collision = 1
		player_body = body
		
func _on_body_exited(body: Node2D) -> void:
	
	if body.is_class("CharacterBody2D"):
		is_collision_joueur = false
		timer_collision = 0
