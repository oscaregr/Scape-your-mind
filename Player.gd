extends KinematicBody2D



#signal hit

const GRAVITY = 50
const JUMP_POWER = -2400
const FLOOR = Vector2(0, -1)

const FIREATTACK = preload("res://FireAttack.tscn")

export var limites = 744
export var speed = 150  # How fast the player will move (pixels/sec).
var screen_size
var life = Resources.life  # Singleton variable
var collision
var points = Resources.points
var TypePlayer = Resources.Obcion_Player
var on_ground = true
var looking_left = false
var TypeAttack:int = 1
var limit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size	
	$Camera2D.limit_right = limites
	pass

func start(pos):
	$Timer.start()
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2()  # The player's movement vector.
	var disparo = Resources.pills
	if((Input.is_key_pressed(KEY_O) || Input.is_key_pressed(KEY_S)) || (Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")) || (on_ground == false || on_ground == true)):
		if (Input.is_key_pressed(KEY_O) && (Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")) && (on_ground == false)):
			$AnimationPlayer.play("B_" + str(TypePlayer) + "_Ataque" + str(TypeAttack))
		elif ((Input.is_key_pressed(KEY_I) && disparo > 0) && (Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")) && (on_ground == false)):
			$AnimationPlayer.play("B_Disparar_Ataque")
		if (Input.is_key_pressed(KEY_O) && (on_ground == false)):
			$AnimationPlayer.play("B_" + str(TypePlayer) + "_Ataque" + str(TypeAttack))
		elif ((Input.is_key_pressed(KEY_I && disparo > 0)) && (on_ground == false)):
			$AnimationPlayer.play("B_Disparar_Ataque")
		elif (Input.is_key_pressed(KEY_O) && (Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")) && (on_ground == true)):
			$AnimationPlayer.play("C_" + str(TypePlayer) + "_Ataque" + str(TypeAttack))
		elif ((Input.is_key_pressed(KEY_I && disparo > 0)) && (Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")) && (on_ground == true)):
			$AnimationPlayer.play("C_Disparar_Ataque")
		elif (Input.is_key_pressed(KEY_O) && (on_ground == true)):
			$AnimationPlayer.play("Q_" + str(TypePlayer) + "_Ataque" + str(TypeAttack))
		elif ((Input.is_key_pressed(KEY_I && disparo > 0)) && (on_ground == true)):
			$AnimationPlayer.play("Q_Disparar_Ataque")
		elif ((Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left")) && (on_ground == true)):
			$AnimationPlayer.play("NA_Caminar")
		elif (on_ground == false):
			$AnimationPlayer.play("NA_Brincar")

	if Input.is_key_pressed(KEY_O):
		$Timer.start()
	
	if Input.is_key_pressed(KEY_I):
		if disparo > 0:
			Resources.pills -=1
			$Timer.start()
			var fireattack = FIREATTACK.instance()
			if sign($Position2D.position.x) == 1:
				fireattack.set_direction(1)
			else:
				fireattack.set_direction(-1)
			get_parent().add_child(fireattack)
			fireattack.position = $Position2D.global_position
	
	
	if ($Timer.is_stopped() == true):
		$AnimationPlayer.play("Quieto")
	
	if Input.is_action_pressed("ui_right"):
		$Timer.start()
		velocity.x += speed
		looking_left = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	
	
	if Input.is_action_pressed("ui_left"):
		$Timer.start()
		velocity.x -= speed
		looking_left = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	
	if Input.is_action_pressed("ui_up"):
		$Timer.start()
		if (on_ground == true):
			
			velocity.y += JUMP_POWER
			on_ground = false
			if (looking_left == false):
				velocity.x += (speed * 7)
			else:
				velocity.x -= (speed * 7)
		
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	if velocity.x != 0:
		$Sprite.flip_v = false
		
		# Flip in different direction
		$Sprite.flip_h = velocity.x < 0
#	elif velocity.y != 0:
#		$AnimationPlayer.play("NA_Brincar")
#
#
	if (get_slide_count() > 0):
		for i in range(get_slide_count()):
			if "Enemy" in get_slide_collision(i).collider.name:
				touched(get_slide_collision(i).collider.name)

func touched(collision_object):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$PainSound.volume_db = 10
	if ($PainSound.playing == false):
		$PainSound.play()
	life -= 1
	get_node("../LifeCounter").text = str("Lives: ",life) 
	#print(Resources.life)
	if (life > 0):
		position.x = 15
		position.y = 0
		start(position)
	else:
		$CollisionShape2D.set_deferred("disabled", true)

func _on_AnimationPlayer_animation_finished(anim_name):
	$Timer.stop()
	pass # Replace with function body.


func _on_Golpe_body_entered(body):
	if ("Player" in body.get_name()):
		
		get_node("../Enemigos").get_parent().remove_child(self)
#		get_node("../" + body.get_name()).hide()
#		get_node("../" + body.get_name()).remove_and_skip()
	pass # Replace with function body.

