extends Area2D

export (int) var speed
var onTheMove = Vector2()
var screen_size
var delt
var TypeEnemy
var rugido = true
var impact = false
var vivo = true
var rng = RandomNumberGenerator.new()
var PosPlayer = Resources.PosPlayer

func sorteo():
	rng.randomize()
	TypeEnemy = rng.randi_range(1, 3)
	$AnimatedSprite.play("walk" + str(TypeEnemy))

func _ready():
	show()
	if impact == false:
		sorteo()
		impact =  true
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	onTheMove = Vector2() #Reinicia el valor
	if delt == 1:
		position += transform.x * speed * delta
		$AnimatedSprite.flip_h = position.x > 0
#		if impact:
#
#			position.x -= 100
#			impact = false
	elif delt == 2:
		position -= transform.x * speed * delta
		$AnimatedSprite.flip_h = position.x < 0
#		if impact:
#
#			position.x += 100
#			impact = false
#	collision = move_and_collide(onTheMove * delta)# Declare member variables here. Examples:


func _on_Golpe_body_entered(body):
	if (body.get_name() == "Player"):
#		get_node("../" + body.get_name()).hide()
		var r = get_node_and_resource("../Player").remove( 1 )
		
#		get_node("../" + body.get_name()).hide()
#		get_node("../" + body.get_name())
	pass # Replace with function body.

#func move(delt):
#	position += onTheMove * delt #Actualizar los movimientos
#	position.x = clamp(position.x, 0, screen_size.x)
#

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()




func _on_Enemigos_area_entered(area):
	if ("Ataque" in area.get_name()):
		if vivo:
			vivo = false
			Resources.Update_Points()
			Resources.Up_Life_Bar()
			self.queue_free()
	#		get_parent().get_child( 0 ).hide()
	#		get_parent().remove_and_skip(self)
	#		queue_free(self)
	#		get_parent().remove_and_skip(self)
		
#		$AnimatedSprite.play("damage" + str(TypeEnemy))
#		impact = true
	if ("Campo" in area.get_name()):
		var posi = Vector2.ZERO
		posi = area.global_position
#		$AnimatedSprite.play("walk" + str(TypeEnemy))
		if rugido:
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("" + str(5 + TypeEnemy)).play()
			rugido = false
		if position.x > posi.x :
			delt = 2
		else :
			delt = 1
		if onTheMove.length() > 0: #Verificar si esta en movimietno
			 onTheMove = onTheMove.normalized() * speed #Normalizar
			
	if ("CuerpoPlayer" in area.get_name()):
		Resources.Update_Life_Bar()
	pass # Replace with function body.





func _on_Enemigos_area_exited(area):
	if ("Campo" in area.get_name()):
		var posi = Vector2.ZERO
		posi = area.global_position
#		$AnimatedSprite.play("walk" + str(TypeEnemy))
		if position.x > posi.x :
			delt = 2
		else :
			delt = 1
		if onTheMove.length() > 0: #Verificar si esta en movimietno
			 onTheMove = onTheMove.normalized() * speed #Normalizar
			
	pass # Replace with function body.
