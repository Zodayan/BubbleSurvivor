class_name CustomSceneTree
extends SceneTree

#Instance du LevelManager qui gère les scènes affichées à l'écran
var _levelManager : LevelManager 
#Instance de PlayerManager : gère les stats du joueurs
var _playerManager : PlayerManager 

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
	_levelManager = LevelManager.new()
	root.add_child(_levelManager)
	_levelManager._initialize()
	
	#Initialisation du PlayerManager
	_playerManager = PlayerManager.new()
	root.add_child(_playerManager)
	_playerManager._initialize()
	
	#Initialisation des scénes de bases
	_levelManager.addScene("res://scenes/bubblePlayer.tscn")
	_levelManager.addScene("res://scenes/michel.tscn")

	
	print("Initialized:")
	print("  Starting time: %s" % str(time_elapsed))

func _process(delta):
	time_elapsed += delta
	# Return true to end the main loop.
	

func _finalize():
	print("Finalized:")
	print("  End time: %s" % str(time_elapsed))
