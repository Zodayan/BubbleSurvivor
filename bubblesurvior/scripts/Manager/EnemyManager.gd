class_name EnnemyManager
extends Node

#Instance de la mainLoop
var _tree : CustomSceneTree

const listEnnemy = [
	"",
	""]

var counterEnnemy : int =0

const listBoss = [
	"",
	""
]

var wave = []

var counterBoss : int =0

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Ennemy Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func _process(delta: float):
	pass	

func _spawnEnnemy():
	pass

func _spawnBoss():
	pass	
