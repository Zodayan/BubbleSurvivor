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

var delay : float = 0.5

var timeElapsed : float =0

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Ennemy Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func _process(delta: float):
	
	timeElapsed+=delta
	
	if timeElapsed>delay :
		
		timeElapsed = 0
	
		if killCount>nbToKill and !isBoss:
			
			_spawnBoss(boss)
			print("boss")
			isBoss = true
			delay = delay*4
				
		var sum : float = 0
		for ennemies in listEnnemy :
			sum += ennemies[1]
		if sum > 0 :
			var res : float = randf_range(0, sum)
			var inf : float = 0 
				
			for enemies in listEnnemy :
						
				if(res <= enemies[1]+inf && res > inf):
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

func _nearest_enemy(pos: Vector2):
	# On renvoie void si il n'y a pas d'ennemis dans la liste d'ennemis
	if len(wave) == 0:
		return
		
	# On va itérer sur la liste des ennemis sur la map pour trouver le plus proche du point d'entrée
	var plus_proche: Enemy = wave[0]
	var meilleure_dist: float = pos.distance_to(plus_proche.position)
	
	for ennemi in wave:
		if pos.distance_to(ennemi.position) < meilleure_dist:
			meilleure_dist = pos.distance_to(ennemi.position)
			plus_proche = ennemi
			
	return plus_proche

func resetSpawner():
	nbToKill = 1000
	killCount = 0
	timeElapsed = 0
	wave = []
	isBoss = false;
	
func bossKilled(boss: Boss):
	_tree.score = killCount
	_tree.win()
