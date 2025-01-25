extends CharacterBody2D

func Deplacement_joueur() -> Vector2: 
	# le mouvement sur l'axe des X
	var deplacementX = Input.get_action_strength("right") - Input.get_action_strength("left"); #input en forme de string c'est degeulasse
	# le mouvement sur l'axe des Y
	var deplacementY = Input.get_action_strength("down") - Input.get_action_strength("up");
	# Le vecteur de mouvement (X,Y)
	return Vector2(deplacementX,deplacementY);
