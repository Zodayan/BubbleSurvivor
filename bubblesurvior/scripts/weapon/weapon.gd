extends Node
class_name Weapon

var degats: float = 1
var vitesse_tir: float = 1 # Nb de tirs/seconde
var cout_tir: float = 1

func tirer(direction: Vector2) -> void:
	print("Tirer ", direction)
	pass
