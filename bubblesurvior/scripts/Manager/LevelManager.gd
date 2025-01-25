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
	_tree.root.queue_free()
