extends Node2D
class_name Weapon

var degats: float = 1
var vitesse_tir: float = 1 # Nb de tirs/seconde
var cout_tir: float = 1
var timer_dernier_tir: float = 1 / vitesse_tir

func _process(delta: float) -> void:
	var player: BubblePlayer = CustomSceneTree.getInstance()._playerManager.playerBody
	position = player.position
	var player_sprite: AnimatedSprite2D = player.get_child(2)
	position.x += player_sprite.global_scale[0] * player_sprite.scale.x / 2
	timer_dernier_tir += delta

# A ne pas toucher en avec héritage
func tirer() -> void:
	if timer_dernier_tir >= 1/vitesse_tir:
		timer_dernier_tir = 0
		CustomSceneTree.getInstance()._playerManager.playerBody.dealDamage(cout_tir)
		action_tirer()
	
# A potentiellement toucher avec héritage
func action_tirer() -> void:
	print("action Tirer")
