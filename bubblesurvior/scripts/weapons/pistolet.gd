extends Weapon

func _init() -> void:
	degats = 10

# A potentiellement toucher avec héritage
func action_tirer() -> void:
	print("action Tirer")
