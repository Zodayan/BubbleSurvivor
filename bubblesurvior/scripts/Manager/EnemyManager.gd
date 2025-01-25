class_name EnnemyManager
extends Node

#Instance de la mainLoop
var _tree : CustomSceneTree

var listEnnemy : Array[Array] 

var boss : String = ""

var isBoss : bool = false;

var wave : Array[Enemy] = []

var killCount : int = 0

var nbToKill : int = 1000

var delay : float = 1

var timeElapsed : float =0

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Ennemy Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func _process(delta: float):
	
	timeElapsed+=delta
	
	if timeElapsed>delay :
		
		timeElapsed = 0
	
		if killCount>nbToKill:
			
			_spawnBoss(boss)
				
		else :
			var sum : float = 0
			for ennemies in listEnnemy :
				sum += ennemies[1]
			if sum > 0 :
				var res : float = randf_range(0, sum)
				var inf : float = 0 
				
				for enemies in listEnnemy :
						
					if(res <= enemies[1] && res > inf):
						_spawnEnnemy(enemies[0])
					inf = enemies[1]
					
					

func _spawnEnnemy(path : String):
	var ennemy = ResourceLoader.load(path).instantiate()
	_tree.root.add_child(ennemy)
	wave.append(ennemy)

func _spawnBoss(path : String):
	var _boss = ResourceLoader.load(path).instantiate()
	_tree.root.add_child(_boss)
	wave.append(_boss)

func _ennemyKilled(ennemy : Enemy) :
	wave.erase(ennemy)
	killCount+=1
