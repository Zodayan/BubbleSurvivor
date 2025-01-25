extends Area2D
class_name Enemy

var vitesse: float = 10
var pv_max: float = 10
var pv: float = pv_max
var degats: float = 1
var direction: Vector2 = Vector2(1, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += vitesse * delta * direction.normalized()[0]
	position.y += vitesse * delta * direction.normalized()[1]
	position.y = sin(float(Time.get_ticks_msec())/1000 * vitesse) * 10

# Se déclenche quand le joueur rentre en collision avec la collision de ce sprite
func _on_body_entered(body: Node2D) -> void:
	print(body.name)
