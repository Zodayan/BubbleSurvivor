extends Control


func _on_restart_pressed() -> void:
	CustomSceneTree.getInstance().startGame()
	self.queue_free() # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.
