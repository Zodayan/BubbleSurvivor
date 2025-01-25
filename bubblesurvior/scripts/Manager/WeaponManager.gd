class_name WeaponManager
extends Node

var _tree : CustomSceneTree

var _weapon : Weapon

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Weapon Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func changeWeapon(weapon):
	if _weapon :
		_tree.root.remove(_weapon)
	_weapon = weapon
	_tree.root.add_child(_weapon)
