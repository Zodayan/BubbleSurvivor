extends CharacterBody2D	
class_name BubblePlayer

@onready var timer = $Timer
@onready var sprite = $BubbleSprite

var deplacementX: float = 0
var deplacementY: float = 0

var timerStarted : bool = false

func _initialize():
	
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
	
	#Récupération de la game Loop
	var _SceneTree : CustomSceneTree = CustomSceneTree.getInstance()
	
	#Accès à la vitesse définie dans le manager
	var speed : float = _SceneTree._playerManager.speed
	
	velocity = movement.normalized()*speed;
	 #normalized-> vitesse constante meme en diagonale
	move_and_slide();
	CustomSceneTree.getInstance()._playerManager.pos = self.position
	
	if Input.is_action_pressed("shoot"):
		shoot()
		
	if Input.is_action_just_pressed("nextWeapon"):
		nextWeapon()
	
	if Input.is_action_just_pressed("prevWeapon"):
		prevWeapon()
	
func nextWeapon():
	print("next")
	CustomSceneTree.getInstance()._weaponManager.nextWeapon()

func prevWeapon():
	print("prev")
	CustomSceneTree.getInstance()._weaponManager.prevWeapon()

func dealDamage(damage : float):
	
	CustomSceneTree.getInstance()._playerManager.hp -= damage
	if CustomSceneTree.getInstance()._playerManager.hp <= 0 :
		death()
	scaleBubble()
	
func heal(healValue : float):
	
	CustomSceneTree.getInstance()._playerManager.hp += healValue
	if CustomSceneTree.getInstance()._playerManager.hp >= CustomSceneTree.getInstance()._playerManager.maxHp :
		overcharge()
	scaleBubble()
	#Modifier barre de vie ?

func overcharge():
	
	if CustomSceneTree.getInstance()._playerManager.hp >= CustomSceneTree.getInstance()._playerManager.maxHpOvercharge :
		print("Explosion Incoming !!!")
		if (!timerStarted) :	
			$Timer.start()
			timerStarted = true
	


func scaleBubble():
	
	sprite.scale = Vector2(1,1)*CustomSceneTree.getInstance()._playerManager.hp/CustomSceneTree.getInstance()._playerManager.maxHp*2	
	

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
