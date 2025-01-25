extends CharacterBody2D	
class_name BubblePlayer

@onready var timer = $Timer

func _initialize():
	
	scaleBubble()
	

func calculMovement() -> Vector2: 
	# le mouvement sur l'axe des X
	var deplacementX = Input.get_action_strength("right") - Input.get_action_strength("left"); #input en forme de string c'est degeulasse
	# le mouvement sur l'axe des Y
	var deplacementY = Input.get_action_strength("down") - Input.get_action_strength("up");
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
		$Timer.start()

func _on_timer_timeout():
	
	if CustomSceneTree.getInstance()._playerManager.hp >= CustomSceneTree.getInstance()._playerManager.maxHp :
		death()		


func scaleBubble():
	
	self.scale = Vector2(1,1)*CustomSceneTree.getInstance()._playerManager.hp/CustomSceneTree.getInstance()._playerManager.maxHp	

func death():
	
	print("i'm dead")
			
func shoot() :
	
	var posMouse : Vector2 =  get_viewport().get_mouse_position()
	
	pass
