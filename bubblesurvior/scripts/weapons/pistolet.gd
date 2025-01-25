extends Weapon

@onready var projectile_scene = preload("res://scenes/projectile_simple.tscn")
@onready var pistolet = $AnimatedSprite2D
@onready var timer = $Timer
func _init() -> void:
	degats = 10
	vitesse_tir = 5
	cout_tir = 1

func _process(delta: float) -> void:
	super._process(delta)
	position.x += 10
# A potentiellement toucher avec héritage
func action_tirer() -> void:
	pistolet.play("tape")
	timer.start(0.5)
	var nouveau_projectile: ProjectileSimple = projectile_scene.instantiate()
	var ennemi_plus_proche: Enemy = CustomSceneTree.getInstance()._ennemyManager._nearest_enemy(position)
	nouveau_projectile.arme_associee = self
	
	# L'arme vise automatiquement l'ennemi le plus proche
	if ennemi_plus_proche:
		nouveau_projectile.direction = ennemi_plus_proche.position - position
	else:
		nouveau_projectile.direction = Vector2(1, 0)
	nouveau_projectile.position = position
	CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
	


func _on_timer_timeout() -> void:
	pistolet.play("default") # Replace with function body.
