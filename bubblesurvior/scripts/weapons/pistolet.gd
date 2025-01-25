extends Weapon

@onready var projectile_scene = preload("res://scenes/projectile_simple.tscn")
@onready var pistolet = $AnimatedSprite2D

func _init() -> void:
	degats = 10
	vitesse_tir = 5
	cout_tir = 1

# A potentiellement toucher avec héritage
func action_tirer() -> void:
	pistolet.play("tape")

	var scene_manager: SceneManager = CustomSceneTree.getInstance()._sceneManager
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	var enemy_manager: EnnemyManager = CustomSceneTree.getInstance()._ennemyManager
	var player_direction: Vector2 = Vector2(player_manager.playerBody.deplacementX, player_manager.playerBody.deplacementY)
	var nouveau_projectile: ProjectileSimple = projectile_scene.instantiate()
	var ennemi_plus_proche: Enemy = CustomSceneTree.getInstance()._ennemyManager._nearest_enemy(position)
	nouveau_projectile.arme_associee = self
	
	# L'arme vise automatiquement l'ennemi le plus proche
	var ennemi_plus_proche: Enemy = enemy_manager._nearest_enemy(position)
	if ennemi_plus_proche:
		nouveau_projectile.direction = ennemi_plus_proche.position - position
	else:
		nouveau_projectile.direction = Vector2(1, 0)
	nouveau_projectile.position = position
	CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
