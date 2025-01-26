extends Control

func initStat(time : float, score : int) :
	
	$score.text = "Ennemy killed : "+str(score)
	$time.text = "Time : "+str(int(time))

func _on_restart_pressed() -> void:
	CustomSceneTree.getInstance().startGame()
	self.queue_free() # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
