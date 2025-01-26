extends Area2D
class_name Heal

const valeur_heal = 5
@onready var timerleft = $Timer



func _on_body_entered(body: Node2D) -> void:
	
	var player: BubblePlayer = body
	player.heal(valeur_heal)
	queue_free()

func _on_timer_timeout():
	print ("fin")
	queue_free()
