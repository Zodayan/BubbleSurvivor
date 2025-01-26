extends Weapon
class_name Bazooka

@onready var projectile_scene = preload("res://scenes/projectile_bazooka.tscn")
@onready var bazooka = $AnimatedSprite2D
@onready var timer = $Timer
@onready var bazooka_sound = $bazooka_sound

func _init() -> void:
	degats = 40
	vitesse_tir = 0.25
	cout_tir = 8
	timer_dernier_tir = 1 / vitesse_tir

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
	bazooka.play("tir")
	
	bazooka_sound.get_children().pick_random().play()

	var scene_manager: SceneManager = CustomSceneTree.getInstance()._sceneManager
	var player_manager: PlayerManager = CustomSceneTree.getInstance()._playerManager
	var enemy_manager: EnnemyManager = CustomSceneTree.getInstance()._ennemyManager
	var player_direction: Vector2 = Vector2(player_manager.playerBody.deplacementX, player_manager.playerBody.deplacementY)
	var nouveau_projectile: ProjectileBazooka = projectile_scene.instantiate()
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
	bazooka.play("default") # Replace with function body.
