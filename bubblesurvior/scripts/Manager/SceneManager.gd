class_name SceneManager
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
	
	return scene
	
func clearLevel():
	
	#Suppression de toute les scènes du scèneTree
	_tree._playerManager.delCharacter()
	_tree._weaponManager.delWeapon()	
	
	for child in _tree.root.get_children() :
		
		if !(child.is_class("EnnemyManager") or child.is_class("PlayerManager") or child.is_class("WeaponManager") or child.is_class("SceneManager")) :
		
			_tree.root.remove_child(child)
			
	
	
