class_name WeaponManager
extends Node

var _tree : CustomSceneTree

var _weapon : Weapon
const listWeapon = [
"",
"",
"",
""]

var currentWeapon : int = 0

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Weapon Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func changeWeapon(weapon):
	if _weapon :
		_tree.root.remove(_weapon)
	_weapon = weapon
	_tree.root.add_child(_weapon)

func nextWeapon():
	if(currentWeapon>=listWeapon.size()):
		currentWeapon = 0
	else :
		currentWeapon+=1
	
	var weapon = ResourceLoader.load(listWeapon[currentWeapon]).instantiate()
	if weapon :
		changeWeapon(weapon)
