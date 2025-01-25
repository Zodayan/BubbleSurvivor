extends Area2D

var vitesse = 1
var pv_max = 10
var pv = pv_max
var degats = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += vitesse * delta

# Se déclenche quand le joueur rentre en collision avec la collision de ce sprite
func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
