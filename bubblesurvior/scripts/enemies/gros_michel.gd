extends Enemy
class_name GrosMichel

func _init() -> void:
	super._init()
	vitesse = 20
	pv_max = 50
	pv = pv_max
	degats = 10
