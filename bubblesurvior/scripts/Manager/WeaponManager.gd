class_name WeaponManager
extends Node

var _tree : CustomSceneTree

var _weapon : Weapon
const listWeapon = [
	"res://scenes/pistolet.tscn",
	"res://scenes/fusil_pompe.tscn",
	"res://scenes/bazooka.tscn",
]

var currentWeapon : int = 0

func _initialize():
	
	#Récupération du SceneTree(MainLoop)
	print("Weapon Manager init...")
	_tree = CustomSceneTree.getInstance()
	
	# Chargement de l'arme
	laodWeapon()
	
func changeWeapon(weapon):
	if _weapon :
		_tree.root.remove_child(_weapon)
	_weapon = weapon
	_tree.root.add_child(_weapon)

func laodWeapon():
	var weapon = ResourceLoader.load(listWeapon[currentWeapon]).instantiate()
	if weapon :
		changeWeapon(weapon)

func prevWeapon():
	currentWeapon -= 1
	if(currentWeapon < 0):
		currentWeapon = listWeapon.size() - 1
	
	laodWeapon()

func nextWeapon():
	currentWeapon += 1
	if(currentWeapon >= listWeapon.size()):
		currentWeapon = 0
	
	laodWeapon()

func delWeapon():
	if _weapon :
		_tree.root.remove_child(_weapon)
	_weapon.queue_free()
	_weapon = null 
