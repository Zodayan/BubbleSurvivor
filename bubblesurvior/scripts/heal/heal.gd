class_name Heal
extends Area2D

var healValue : float = 1

func _on_body_entered(body: Node2D) -> void:
	# Si on détecte une collision avec le joueur, on active le mode "dégats au joueur",
	#qui va faire des dégats au joueur toutes les secondes
	if body.is_class("CharacterBody2D"):
		var player : CharacterBody2D = body
		if player == CustomSceneTree.getInstance()._playerManager.playerBody :
			player.heal(healValue)
