extends Control

func _ready() :
	$hpBar.value = CustomSceneTree.getInstance()._playerManager.hp
