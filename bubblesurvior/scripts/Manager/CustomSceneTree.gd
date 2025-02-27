class_name CustomSceneTree
extends SceneTree

#Instance du SceneManager qui gère les scènes affichées à l'écran
var _sceneManager : SceneManager 
#Instance de PlayerManager : gère les stats du joueurs
var _playerManager : PlayerManager 

var _weaponManager : WeaponManager

var _ennemyManager : EnnemyManager

var listManager : Array 

#Instance de la mainLoop
static var _instance : CustomSceneTree

var time_elapsed : float = 0

var score : int = 0

#Méthode permettant d'accéder à la GameLoop
static func getInstance():
	
	return _instance

func _initialize():
	
	print("Custom Scene Tree init...")
	#Initialisation de la variable d'accès au SceneTree
	_instance = self
	
	#Initialisation du LevelManager
	_sceneManager = SceneManager.new()
	
	#Initialisation du PlayerManager
	_playerManager = PlayerManager.new()
	
	_weaponManager = WeaponManager.new()
	
	_ennemyManager = EnnemyManager.new()
	
	root.add_child(_sceneManager)
	_sceneManager._initialize()
	
	_sceneManager.addScene("res://scenes/start_screen.tscn")
	
	print("Initialized:")
	print("  Starting time: %s" % str(time_elapsed))

func _process(delta):
	time_elapsed += delta
	# Return true to end the main loop.
	

func _finalize():
	print("Finalized:")
	print("  End time: %s" % str(time_elapsed))

func startGame():
	
	#ReAdding Manager
	
	root.add_child(_sceneManager)
	_sceneManager._initialize()
	
	root.add_child(_playerManager)
	_playerManager._initialize()
	
	root.add_child(_weaponManager)
	_weaponManager._initialize()
	
	root.add_child(_ennemyManager)
	_ennemyManager._initialize()
		
	#Initialisation Joueur
	_playerManager.resetStat()
	
	var player = ResourceLoader.load("res://scenes/bubblePlayer.tscn").instantiate()
	_playerManager.changeCharacter(player)
	
	#Initialisation des scénes de bases
	
	_sceneManager.addScene("res://scenes/map.tscn")
	
	var data : DL1 = DL1.new()
	
	_ennemyManager.resetSpawner()
	_ennemyManager.listEnnemy = data.liste_ennemis
	_ennemyManager.nbToKill = data.score_pour_boss
	_ennemyManager.boss = data.boss
	
	
	
func gameOver():
	_sceneManager.clearLevel()
	_sceneManager.addScene("res://scenes/DeathMenu.tscn")

func win():
	_sceneManager.clearLevel()
	_sceneManager.addScene("res://scenes/Menu_Win.tscn")
	self.root.get_node("MenuWin").initStat(time_elapsed,score)
