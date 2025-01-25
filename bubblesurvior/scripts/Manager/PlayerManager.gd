class_name PlayerManager
extends Node

#Instance de la mainLoop
var _tree : CustomSceneTree

#Variables liées aux joueur
var hp : float = 50
const maxHp : float = 100
const minHp : float = 0
const maxHpOvercharge : float = 120
var pos : Vector2
var damage : float = 10
var speed : float = 180

#Character(Scene) :

var playerBody : BubblePlayer

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Player Manager init...")
	_tree = CustomSceneTree.getInstance()

#Reset les stats du joueur	
func resetStat():
	
	hp = 50
	damage = 10	
	speed = 180
	
func changeCharacter(player : CharacterBody2D):
	if playerBody :
		_tree.root.remove_child(playerBody)
	playerBody = player
	_tree.root.add_child(playerBody)
