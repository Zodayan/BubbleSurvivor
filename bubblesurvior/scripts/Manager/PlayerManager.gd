class_name PlayerManager
extends Node

var _tree : CustomSceneTree

var hp : float = 50
const maxHp : float = 100
const minHp : float = 0
const maxHpOvercharge : float = 120
var posx : float = 0
var posy : float = 0
var damage : float = 10

func _initialize():
	
	print("Player Manager init...")
	_tree = CustomSceneTree.getInstance()
	
func resetStat():
	
	hp = 50
	posx = 0
	posy = 0
	damage = 10	
	
	
