class_name EnnemyManager
extends Node

#Instance de la mainLoop
var _tree : CustomSceneTree

const listEnnemy = [
	"res://scenes/michel.tscn"
	]

var counterEnnemy : int =0

const listBoss = [
	"",
	""
]
var counterBoss : int =0

var wave = []

var isBoss : bool = false;

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Ennemy Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func _process(delta: float):
	pass	

func _spawnEnnemy():
	var ennemy = ResourceLoader.load(listEnnemy[counterEnnemy]).instantiate()
	_tree.root.add_child(ennemy)
	wave.append(ennemy)

func _spawnBoss():
	var boss = ResourceLoader.load(listBoss[counterBoss]).instantiate()
	_tree.root.add_child(boss)
	wave.append(boss)
