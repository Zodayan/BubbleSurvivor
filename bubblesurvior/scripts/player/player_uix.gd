extends Control

func _ready() :
	$hpBar.value = CustomSceneTree.getInstance()._playerManager.hp

func changeValue() :
	
	$hpBar.value = CustomSceneTree.getInstance()._playerManager.hp
	
	if $hpBar.value >= 100 :
		
		$OverchargeBar.value = CustomSceneTree.getInstance()._playerManager.hp-100
	
	else :
		
		$OverchargeBar.value = 0
