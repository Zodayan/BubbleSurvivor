extends CharacterBody2D	
class_name BubblePlayer

@onready var timer = $Timer
@onready var sprite = $BubbleSprite
@onready var hitbox = $BubbleHitbox 

@onready var walkNoise = $BubbleWalkNoise

var deplacementX: float = 0
var deplacementY: float = 0

var noiseTimer : float = 0
var timerStarted : bool = false

var dash_skill_instance = Dash.new()

var skill_list: Array = [dash_skill_instance]

var is_invincible: bool = false

func _initialize():
	
	scaleBubble()
		#calcul de la taille du player
	var ratio = CustomSceneTree.getInstance()._playerManager.hp/CustomSceneTree.getInstance()._playerManager.maxHp
	
	#update de l'affichage du player
	var direction = calculMovement()[0]
	sprite.updateSprite(ratio, direction)	

func _ready():
	
	scaleBubble()	

func calculMovement() -> Vector2: 
	# le mouvement sur l'axe des X
	deplacementX = Input.get_action_strength("right") - Input.get_action_strength("left"); #input en forme de string c'est degeulasse
	# le mouvement sur l'axe des Y
	deplacementY = Input.get_action_strength("down") - Input.get_action_strength("up");
	# Le vecteur de mouvement (X,Y)
	return Vector2(deplacementX,deplacementY);
	
func _physics_process(_delta):
	
	#calcul du vecteur direction
	var movement : Vector2 = calculMovement()
	
	#calcul de la taille du player
	var ratio = CustomSceneTree.getInstance()._playerManager.hp/CustomSceneTree.getInstance()._playerManager.maxHp
	
	#update de l'affichage du player
	var direction = movement[0]
	sprite.updateSprite(ratio, direction)	
	
	#Récupération de la game Loop
	var _SceneTree : CustomSceneTree = CustomSceneTree.getInstance()
	
	#Accès à la vitesse définie dans le manager
	var speed : float = _SceneTree._playerManager.speed
	
	velocity = movement.normalized()*speed;
	 #normalized-> vitesse constante meme en diagonale
	
	noiseTimer += _delta
	if velocity[0] != 0 or velocity[1] != 0 :
		if noiseTimer > 0.4 :
			noiseTimer = 0
			walkNoise.get_children().pick_random().play()
	
	move_and_slide();
	CustomSceneTree.getInstance()._playerManager.pos = self.position
	
	if Input.is_action_pressed("shoot"):
		shoot()
		
	if Input.is_action_just_pressed("nextWeapon"):
		nextWeapon()
	
	if Input.is_action_just_pressed("prevWeapon"):
		prevWeapon()
	
	if Input.is_action_just_pressed("skill1"):
		dash_skill_instance.dash()
		
	for skill in skill_list:
		skill._process(_delta)
	
func nextWeapon():
	print("next")
	CustomSceneTree.getInstance()._weaponManager.nextWeapon()

func prevWeapon():
	print("prev")
	CustomSceneTree.getInstance()._weaponManager.prevWeapon()

func dealDamage(damage : float):
	if is_invincible:
		return
	
	CustomSceneTree.getInstance()._playerManager.hp -= damage
	if CustomSceneTree.getInstance()._playerManager.hp <= 0 :
		death()
	if CustomSceneTree.getInstance()._playerManager.hp <=100 and timerStarted :
		timerStarted = false
		$Timer.stop()	
		
	scaleBubble()
	$Control.changeValue()
	
func heal(healValue : float):
	
	CustomSceneTree.getInstance()._playerManager.hp += healValue
	if CustomSceneTree.getInstance()._playerManager.hp >= CustomSceneTree.getInstance()._playerManager.maxHp :
		overcharge()
	scaleBubble()
	$Control.changeValue()

func overcharge():
	
	if CustomSceneTree.getInstance()._playerManager.hp >= CustomSceneTree.getInstance()._playerManager.maxHpOvercharge :
		print("Explosion Incoming !!!")
		if (!timerStarted) :	
			$Timer.start()
			timerStarted = true
	


func scaleBubble():
	
	var direction = calculMovement()[0]
	var ratio = CustomSceneTree.getInstance()._playerManager.hp/CustomSceneTree.getInstance()._playerManager.maxHp
	var spSize = sprite.updateSprite(ratio, direction)
	sprite.scale = Vector2(1,1)*ratio*(6-spSize)*2
	hitbox.scale = Vector2(1,1)*ratio*(6-spSize)*2
	

func death():
	
	print("i'm dead")
	CustomSceneTree.getInstance().gameOver()
			
func shoot() :
	
	CustomSceneTree.getInstance()._weaponManager._weapon.tirer()
	
	
	pass


func _on_timer_timeout() -> void:
	
	if CustomSceneTree.getInstance()._playerManager.hp >= CustomSceneTree.getInstance()._playerManager.maxHp :
		death()		 # Replace with function body.
	timerStarted = false
