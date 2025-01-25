extends Weapon

@onready var projectile_scene = preload("res://scenes/projectile_simple.tscn")

func _init() -> void:
	degats = 10

# A potentiellement toucher avec héritage
func action_tirer() -> void:	
	var scene_manager: SceneManager = CustomSceneTree.getInstance()._sceneManager
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	var player_direction: Vector2 = Vector2(player_manager.playerBody.deplacementX, player_manager.playerBody.deplacementY)
	#scene_manager.addScene("res://scenes/projectile_simple.tscn")
	var nouveau_projectile: ProjectileSimple = projectile_scene.instantiate()
	nouveau_projectile.arme_associee = self
	if player_direction.is_zero_approx():
		nouveau_projectile.direction = Vector2(1, 0)
	else:
		nouveau_projectile.direction = Vector2(player_manager.playerBody.deplacementX, player_manager.playerBody.deplacementY)
	nouveau_projectile.penetration = 1
	nouveau_projectile.vitesse = 300
	nouveau_projectile.position = position
	CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
