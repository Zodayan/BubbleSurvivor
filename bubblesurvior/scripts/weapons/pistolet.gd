extends Weapon

@onready var projectile_scene = preload("res://scenes/projectile_simple.tscn")
@onready var pistolet = $AnimatedSprite2D
@onready var timer = $Timer
@onready var pistol_sound1 = $pistolShoot1
@onready var pistol_sound2 = $pistolShoot2
@onready var pistol_sound3 = $pistolShoot3
@onready var pistol_sound4 = $pistolShoot4
@onready var pistol_sound5 = $pistolShoot5

func _init() -> void:
	degats = 10
	vitesse_tir = 5
	cout_tir = 1.5

func _process(delta: float) -> void:
	super._process(delta)
	position.x += 10
	
	"""if direction.x > 0 :
		pistolet.flip_h = true
	if direction.x<0:
		pistolet.flip_h = false
"""
	
# A potentiellement toucher avec héritage
func action_tirer() -> void:
	timer.start(0.5)
	pistolet.play("tape")
	
	var rng = randi_range(0, 4)
	if (rng == 0):
		pistol_sound1.play()
	elif (rng == 1):
		pistol_sound2.play()
	elif (rng == 1):
		pistol_sound3.play()
	elif (rng == 1):
		pistol_sound4.play()
	else :
		pistol_sound5.play()
	
	var scene_manager: SceneManager = CustomSceneTree.getInstance()._sceneManager
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	var enemy_manager: EnnemyManager = CustomSceneTree.getInstance()._ennemyManager
	var player_direction: Vector2 = Vector2(player_manager.playerBody.deplacementX, player_manager.playerBody.deplacementY)
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
