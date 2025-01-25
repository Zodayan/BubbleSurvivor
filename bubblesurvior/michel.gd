extends "res://scripts/enemies/enemy.gd"

func _process(delta: float) -> void:
	position.x += - vitesse * delta * direction.normalized()[0]
	position.y += vitesse * delta * direction.normalized()[1]
	position.y = sin(float(Time.get_ticks_msec())/1000 * vitesse) * 10
