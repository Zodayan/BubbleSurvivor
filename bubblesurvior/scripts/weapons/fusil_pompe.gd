extends Weapon
class_name FusilPompe

@onready var projectile_scene = preload("res://scenes/projectile_fusil_pompe.tscn")
@onready var shoot_sound1 = $shootSound1
@onready var shoot_sound2 = $shootSound2

var nb_projectiles = 5
var envergure_tir = deg_to_rad(60)

func _init() -> void:
	degats = 10
	vitesse_tir = 1
	cout_tir = 4

func _process(delta: float) -> void:
	super._process(delta)
	position.x +=10
	
	"""if direction.x > 0 :
		pistolet.flip_h = true
	if direction.x<0:
		pistolet.flip_h = false
"""
# A potentiellement toucher avec héritage
func action_tirer() -> void:
	
	var rng = randi_range(0, 1)
	if (rng == 0) :
		shoot_sound1.play()
	else :
		shoot_sound2.play()
		
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	var ennemi_plus_proche: Enemy = CustomSceneTree.getInstance()._ennemyManager._nearest_enemy(player_manager.pos)
	var direction_initiale_projectile: Vector2
	# L'arme vise automatiquement l'ennemi le plus proche
	if ennemi_plus_proche:
		direction_initiale_projectile = ennemi_plus_proche.position - position
	else:
		direction_initiale_projectile = Vector2(1, 0)
	direction_initiale_projectile = direction_initiale_projectile.normalized()
	
	# On fait apparaître les plusiseurs projectiles du fusil, avec une trajectoire conique
	for i in range(nb_projectiles):
		var nouveau_projectile: ProjectileFusilPompe = projectile_scene.instantiate()
		var angle_projectile = (i - nb_projectiles/2) * envergure_tir / nb_projectiles
		nouveau_projectile.arme_associee = self
		nouveau_projectile.position = position
		nouveau_projectile.penetration = 2
		
		nouveau_projectile.direction = direction_initiale_projectile.rotated(angle_projectile)
		
		CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
