extends Weapon

func _init() -> void:
	degats = 10

# A potentiellement toucher avec héritage
func action_tirer() -> void:
	var scene_manager : SceneManager = CustomSceneTree.getInstance()._sceneManager
	scene_manager.addScene("res://scenes/projectile_simple.tscn")
