extends Control

var ThemeR = load("res://assets/Styles/HealthBarRed.tres")
var ThemeB = load("res://assets/Styles/HealthBarClassic.tres")
var ThemeY = load("res://assets/Styles/HealthBarYellow.tres")

func _ready() :
	$hpBar.value = CustomSceneTree.getInstance()._playerManager.hp

func changeValue() :
	
	$hpBar.value = CustomSceneTree.getInstance()._playerManager.hp
	
	if $hpBar.value >= 100 :
		
		$OverchargeBar.value = CustomSceneTree.getInstance()._playerManager.hp-100
		
		if $OverchargeBar.value >= 20 :
			
			
			$OverchargeBar.set_theme(ThemeR)
			$hpBar.set_theme(ThemeR)
			
	
	else :
		
		$OverchargeBar.value = 0
		$OverchargeBar.set_theme(ThemeY)	
		
		if($hpBar.value <= 50 and $hpBar.value > 20) :
			
			$hpBar.set_theme(ThemeY)
			
		elif ($hpBar.value <= 20) :
			
			$hpBar.set_theme(ThemeR)
			
		else :

			$hpBar.set_theme(ThemeB)
