extends Node2D
class_name Weapon

var degats: float = 1
var vitesse_tir: float = 1 # Nb de tirs/seconde
var cout_tir: float = 1

# A ne pas toucher en avec héritage
func tirer() -> void:
	action_tirer()
	
# A potentiellement toucher avec héritage
func action_tirer() -> void:
	print("action Tirer")
