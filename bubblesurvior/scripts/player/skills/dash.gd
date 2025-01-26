extends Node2D
class_name Dash

var is_dashing: bool = false
const MAX_DIST: float = 300
const DASH_SPEED = MAX_DIST
var distance: float = 0
var base_player_speed: float = 0

func dash() -> void:
	if not is_dashing:
		print("dashing")
		var player: BubblePlayer = CustomSceneTree.getInstance()._playerManager.playerBody
		is_dashing = true
		distance = 0
		base_player_speed = CustomSceneTree.getInstance()._playerManager.speed
		player.dealDamage(CustomSceneTree.getInstance()._playerManager.maxHp * 20 / 100)
		player.is_invincible = true
		CustomSceneTree.getInstance()._playerManager.speed += DASH_SPEED
	pass

func _process(delta: float) -> void:
	if is_dashing:
		if distance < MAX_DIST:
			distance += delta * CustomSceneTree.getInstance()._playerManager.speed
			print(distance)
		else:
			is_dashing = false
			CustomSceneTree.getInstance()._playerManager.speed = base_player_speed
			var player: BubblePlayer = CustomSceneTree.getInstance()._playerManager.playerBody
			player.is_invincible = false
