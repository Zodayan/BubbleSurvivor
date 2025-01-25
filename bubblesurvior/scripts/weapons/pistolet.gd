extends Weapon

@onready var projectile_scene = preload("res://scenes/projectile_simple.tscn")
@onready var pistolet = $AnimatedSprite2D

func _init() -> void:
	degats = 10
	
# A potentiellement toucher avec héritage
func action_tirer() -> void:
	pistolet.play("tape")
	var nouveau_projectile: ProjectileSimple = projectile_scene.instantiate()
	nouveau_projectile.arme_associee = self
	# L'arme vise automatiquement l'ennemi le plus proche
	var ennemi_plus_proche: Enemy = CustomSceneTree.getInstance()._ennemyManager._nearest_enemy(position)
	if ennemi_plus_proche:
		nouveau_projectile.direction = ennemi_plus_proche.position - position
	else:
		nouveau_projectile.direction = Vector2(1, 0)
	nouveau_projectile.position = position
	CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
