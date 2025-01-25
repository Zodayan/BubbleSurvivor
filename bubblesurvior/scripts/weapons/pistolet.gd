extends Weapon

func _init() -> void:
	degats = 10

# A potentiellement toucher avec héritage
func action_tirer() -> void:
	var level_manager: LevelManager = CustomSceneTree.getInstance()._levelManager
	level_manager.addScene("res://scenes/projectile_simple.tscn")
