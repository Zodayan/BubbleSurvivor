class_name LevelManager
extends Node

var _tree : CustomSceneTree

func _initialize():
	
	print("Level Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func addScene(path : String):
	
	
	var scene = ResourceLoader.load(path).instantiate()
	
	_tree.root.add_child(scene)
	
func clearLevel():
	
	_tree.root.queue_free()
