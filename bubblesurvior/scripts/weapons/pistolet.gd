extends Weapon

@onready var projectile_scene = preload("res://scenes/projectile_simple.tscn")

func _init() -> void:
	degats = 10

# A potentiellement toucher avec héritage
func action_tirer() -> void:
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	var enemy_manager: EnnemyManager = CustomSceneTree.getInstance()._ennemyManager
	var nouveau_projectile: ProjectileSimple = projectile_scene.instantiate()
	nouveau_projectile.arme_associee = self
	# L'arme vise automatiquement l'ennemi le plus proche
	var ennemi_plus_proche: Enemy = enemy_manager._nearest_enemy(position)
	if ennemi_plus_proche:
		nouveau_projectile.direction = ennemi_plus_proche.position - position
	else:
		nouveau_projectile.direction = Vector2(1, 0)
	nouveau_projectile.position = position
	CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
