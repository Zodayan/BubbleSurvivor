extends CharacterBody2D	

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
