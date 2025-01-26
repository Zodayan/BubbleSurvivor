extends Enemy
class_name GrosMichel
@onready var animatedbody =$AnimatedSprite2D
func _init() -> void:
	super._init()
	vitesse = 20
	pv_max = 50
	pv = pv_max
	degats = 10
	
func _process(delta: float) -> void:
	super._process(delta)
	animatedbody.flip_v=false
