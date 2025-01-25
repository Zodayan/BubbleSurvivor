class_name LevelManager
extends Node

var _tree : CustomSceneTree

func _initialize():
	
	print("Level Manager init...")
	#Récupération du SceneTree
	_tree = CustomSceneTree.getInstance()
	
func addScene(path : String):
	
	#Récupération du fichier et chargement de la scène correspondante
	var scene = ResourceLoader.load(path).instantiate()
	
	#Ajout de la scène au SceneTree
	_tree.root.add_child(scene)
	
func clearLevel():
	
	#Suppression de toute les scènes du scèneTree
	var children = _tree.root.get_children()
	for child in children :
		_tree.root.remove_child(child)
		child.queue_free()
