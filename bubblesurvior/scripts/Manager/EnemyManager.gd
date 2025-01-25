class_name EnnemyManager
extends Node

#Instance de la mainLoop
var _tree : CustomSceneTree

var listEnnemy : Dictionary 

var boss : String = ""

var isBoss : bool = false;

var wave = []

var killCount : int = 0

var nbToKill : int

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Ennemy Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func _process(delta: float):
	
	if killCount>nbToKill:
		_spawnBoss(boss)	
	else :
		pass

func _spawnEnnemy(path : String):
	var ennemy = ResourceLoader.load(path).instantiate()
	_tree.root.add_child(ennemy)
	wave.append(ennemy)

func _spawnBoss(path : String):
	var boss = ResourceLoader.load(path).instantiate()
	_tree.root.add_child(boss)
	wave.append(boss)

func _ennemyKilled(ennemy : Enemy) :
	wave.erase(ennemy)
	killCount+=1
