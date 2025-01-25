class_name CustomSceneTree
extends SceneTree

var _levelManager : LevelManager 
var _playerManager : PlayerManager 
static var _instance : CustomSceneTree

var time_elapsed : float = 0

static func getInstance():
	
	return _instance

func _initialize():
	
	print("Custom Scene Tree init...")
	_instance = self
	_levelManager = LevelManager.new()
	root.add_child(_levelManager)
	_levelManager._initialize()
	_playerManager = PlayerManager.new()
	root.add_child(_playerManager)
	_playerManager._initialize()
	
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
