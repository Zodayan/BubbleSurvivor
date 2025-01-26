extends Enemy
class_name Boss

func death() :
	
	CustomSceneTree.getInstance()._ennemyManager.bossKilled(self)
	super()
