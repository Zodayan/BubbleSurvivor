extends Boss

var delay = 2
var timeSinceAttack = 0
@onready var projectile_scene = preload("res://scenes/Spikes.tscn")
@onready var anoime = $AnimatedSprite2D
@onready var life = $ProgressBar

func _init() -> void:
	super._init()
	vitesse = 40
	pv_max = 250
	pv = pv_max
	degats = 15

func _process(delta: float) -> void:
	anoime.play("tape")
	timeSinceAttack+=delta
	
	gerer_deplacement(delta)
	
	gerer_collision_joueur(delta)
	anoime.flip_v=false
	var posXJ = CustomSceneTree.getInstance()._playerManager.pos[0]
	var posYJ = CustomSceneTree.getInstance()._playerManager.pos[1]
	
	var posXB = self.position[0]
	var posYB = self.position[1]
	
	if sqrt(pow((posXB-posXJ),2)+pow((posYB-posYJ),2)) <= 600 :
		if  timeSinceAttack >= delay :
			timeSinceAttack = 0	
			shootSpikes()
			
	life.value = pv 

func shootSpikes():
	
	var nb_projectiles = 20
	var envergure_tir = deg_to_rad(18)
	
	for i in range(nb_projectiles):
		var nouveau_projectile: ProjectileEnnemy = projectile_scene.instantiate()
		var angle_projectile = envergure_tir 
		nouveau_projectile.position = position
		nouveau_projectile.penetration = 2
		nouveau_projectile.distance_max = 600
		
		nouveau_projectile.direction = nouveau_projectile.direction.rotated(angle_projectile*i)
		nouveau_projectile.rotation = nouveau_projectile.rotation+ angle_projectile*i
		
		
		CustomSceneTree.getInstance().root.add_child(nouveau_projectile)
