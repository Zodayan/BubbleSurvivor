class_name CustomSceneTree
extends SceneTree

#Instance du SceneManager qui gère les scènes affichées à l'écran
var _sceneManager : SceneManager 
#Instance de PlayerManager : gère les stats du joueurs
var _playerManager : PlayerManager 

var _weaponManager : WeaponManager

var _ennemyManager : EnnemyManager

#Instance de la mainLoop
static var _instance : CustomSceneTree

var time_elapsed : float = 0

#Méthode permettant d'accéder à la GameLoop
static func getInstance():
	
	return _instance

func _initialize():
	
	print("Custom Scene Tree init...")
	#Initialisation de la variable d'accès au SceneTree
	_instance = self
	
	#Initialisation du LevelManager
	_sceneManager = SceneManager.new()
	root.add_child(_sceneManager)
	_sceneManager._initialize()
	
	#Initialisation du PlayerManager
	_playerManager = PlayerManager.new()
	root.add_child(_playerManager)
	_playerManager._initialize()
	
	_weaponManager = WeaponManager.new()
	root.add_child(_weaponManager)
	_weaponManager._initialize()
	
	_ennemyManager = EnnemyManager.new()
	root.add_child(_ennemyManager)
	_ennemyManager._initialize()

	
	#Initialisation Joueur
	
	var player = ResourceLoader.load("res://scenes/bubblePlayer.tscn").instantiate()
	_playerManager.changeCharacter(player)
	
	#Initialisation de l'arme
	var arme = ResourceLoader.load("res://scenes/pistolet.tscn").instantiate()
	_weaponManager.changeWeapon(arme)
	
	#Initialisation des scénes de bases
	
	var data : DL1 = DL1.new()
	
	_ennemyManager.listEnnemy = data.liste_ennemis
	_ennemyManager.nbToKill = data.score_pour_boss
	_ennemyManager.boss = "res://scenes/gros_michel.tscn"
	
	print("Initialized:")
	print("  Starting time: %s" % str(time_elapsed))

func _process(delta):
	time_elapsed += delta
	# Return true to end the main loop.
	

func _finalize():
	print("Finalized:")
	print("  End time: %s" % str(time_elapsed))
