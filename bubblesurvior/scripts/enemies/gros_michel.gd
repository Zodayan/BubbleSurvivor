extends Enemy
class_name GrosMichel
@onready var animatedbody =$AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var SFX_node = $SFX

var direction_x: float = 0
var direction_y: float = 0

var isCharging : bool = false
var isSkillActivated : bool = false


func _init() -> void:
	super._init()
	vitesse = 30
	pv_max = 50
	pv = pv_max
	degats = 10
	
func _process(delta: float) -> void:
	if direction_x > 0:
		animatedbody.flip_h = false
	elif direction_x <0 :
		animatedbody.flip_h=true
	if isCharging :
		animatedbody.play("stop")
		gerer_collision_joueur(delta)
			
	elif isSkillActivated :
		animatedbody.play("fonce")
		position.x += direction_x*delta*vitesse*10
		position.y += direction_y*delta*vitesse*10
		gerer_collision_joueur(delta)
	
	else :
		animatedbody.play("default")
		super._process(delta)
		animatedbody.flip_v=false
		animatedbody.play("tape")
	
		var posXJ = CustomSceneTree.getInstance()._playerManager.pos[0]
		var posYJ = CustomSceneTree.getInstance()._playerManager.pos[1]
		
		var posXB = self.position[0]
		var posYB = self.position[1]
		
		if sqrt(pow((posXB-posXJ),2)+pow((posYB-posYJ),2)) <= 400 :
			
			startCharge()
		
	
	
	
func startCharge() :
	
	print("start charge")
	direction = Vector2(CustomSceneTree.getInstance()._playerManager.pos - position)
	direction_x = direction.normalized()[0]
	direction_y = direction.normalized()[1]
	$ChargeTimer.start()
	isCharging = true
	


func _on_charge_timer_timeout() -> void:
	
	
	print("start skill")
	isCharging = false
	isSkillActivated = true	
	$SkillTimer.start()


func _on_skill_timer_timeout() -> void:
	isSkillActivated = false # Replace with function body.
	
func death() -> void :
	if not dead:
		dead = true
		CustomSceneTree.getInstance()._ennemyManager._ennemyKilled(self)
		var nouveau_heal: Heal = CustomSceneTree.getInstance()._sceneManager.addScene("res://scenes/heal.tscn")
		nouveau_heal.position = position
		animation_player.play("death_animation")
	
func play_sound() -> void:
	var sound_list: Array = SFX_node.get_children()
	var sound_node = sound_list.pick_random()
	var sound: AudioStreamPlayer = sound_node
	sound.play()
