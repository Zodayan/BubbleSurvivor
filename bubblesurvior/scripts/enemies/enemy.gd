extends Area2D
class_name Enemy

const DELAI_DEGATS: float = 1 #delais de 1s pour infliger à nouveau des dégats au joueur
const DISTANCE_APPARITION: Array[float] = [200, 300]
var vitesse: float = 100
var pv_max: float = 10
var pv: float = pv_max
var degats: float = 5
var direction: Vector2 = Vector2(1, 0)
var is_collision_joueur: bool = false
var timer_collision: float = 0
var player_body: BubblePlayer
var dead: bool = false
@onready var fleche_ennemy = $AnimatedSprite2D

func _init() -> void:
	# On fait apparaître l'ennemi autour du joueur
	var angle: float = randf_range(0, 2*PI)
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	position = Vector2(	player_manager.pos[0] + cos(angle) * randf_range(DISTANCE_APPARITION[0], DISTANCE_APPARITION[1]),
						player_manager.pos[1] + sin(angle) * randf_range(DISTANCE_APPARITION[0], DISTANCE_APPARITION[1]))
	
func _process(delta: float) -> void:
	
	gerer_deplacement(delta)
	
	gerer_collision_joueur(delta)
	
func deal_damage(damage: float) -> void:
	pv -= damage
	if pv <= 0 :
		death()
		
func heal(heal_value: float):
	pv += heal_value
	if pv > pv_max:
		pv = pv_max
		
func death():
	if not dead:
		dead = true
		CustomSceneTree.getInstance()._ennemyManager._ennemyKilled(self)
		if randf() < 0.4:
			var nouveau_heal: Heal = CustomSceneTree.getInstance()._sceneManager.addScene("res://scenes/heal.tscn")
			nouveau_heal.position = position
		queue_free()
	
func gerer_deplacement(delta: float) -> void:
	# Par défaut les ennemis vont tout droit vers le joueur
	direction = Vector2(CustomSceneTree.getInstance()._playerManager.pos - position)
	var direction_x: float = vitesse * delta * direction.normalized()[0]
	var direction_y: float = vitesse * delta * direction.normalized()[1]
	if direction_x > 0:
		fleche_ennemy.flip_h = true
	if direction_x < 0: 
		fleche_ennemy.flip_h = false
		
	if direction_y > 0: 
		fleche_ennemy.flip_v = true
	if direction_y < 0:
		fleche_ennemy.flip_v =false
	
	
	
	position.x += direction_x
	position.y += direction_y
	
func gerer_collision_joueur(delta: float) -> void:
	# Si le joueur est en collision avec cet ennemi et que ca fait plus d'une seconde que le joueur a subi des
	#dégats avec cet ennemi, alors le joueur prendre des dégats
	if is_collision_joueur:
		if timer_collision >= DELAI_DEGATS:
			player_body.dealDamage(degats)
			timer_collision = 0
	timer_collision += delta

# Se déclenche quand le joueur rentre en collision avec la collision de ce sprite
func _on_body_entered(body: Node2D) -> void:
	# Si on détecte une collision avec le joueur, on active le mode "dégats au joueur",
	#qui va faire des dégats au joueur toutes les secondes
	if body.is_class("CharacterBody2D"):
		is_collision_joueur = true
		player_body = body

func _on_body_exited(body: Node2D) -> void:
	if body.is_class("CharacterBody2D"):
		is_collision_joueur = false
