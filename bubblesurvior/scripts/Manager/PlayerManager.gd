class_name PlayerManager
extends Node

#Instance de la mainLoop
var _tree : CustomSceneTree

#Variables liées aux joueur
var hp : float = 50
const maxHp : float = 100
const minHp : float = 0
const maxHpOvercharge : float = 120
var posx : float = 0
var posy : float = 0
var damage : float = 10
var speed : float = 60 

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Player Manager init...")
	_tree = CustomSceneTree.getInstance()

#Reset les stats du joueur	
func resetStat():
	
	hp = 50
	posx = 0
	posy = 0
	damage = 10	
	speed = 60
	
	
