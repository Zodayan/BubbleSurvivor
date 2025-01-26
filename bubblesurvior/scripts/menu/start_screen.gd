extends Control



func _on_close_pressed() -> void:
	CustomSceneTree.getInstance().startGame()
	self.queue_free() # Replace with function body.
