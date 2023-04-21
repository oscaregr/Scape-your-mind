extends Area2D

var dead_scene = preload("res://Dead.tscn")
var menu_scene = preload("res://Menu.tscn")
var pasillo1_scene = preload("res://Pasillo2.tscn")
var pasillo2_scene = preload("res://Pasillo.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var PosPlayer
var esena
var Max_life
var life = 130
var Obcion_Player = 1
var tiempo
var points = 0
var pills = 0




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Update_Life_Bar ():
	life -= 10
	get_tree().get_nodes_in_group("LifeBar")[0].value = life
	if get_tree().get_nodes_in_group("LifeBar")[0].value == 0:
		get_tree().change_scene_to(dead_scene)
		


func Up_Life_Bar ():
	if life <= 125:
		life += 5
		get_tree().get_nodes_in_group("LifeBar")[0].value = life

func Life_Box():
	if life <= 110:
		life += 20
		get_tree().get_nodes_in_group("LifeBar")[0].value = life

func Update_Points ():
	points += 100
	get_tree().get_nodes_in_group("Points")[0].text = str(points) + " Points"
	

func Update_Cronometro ():
	tiempo -= 1
	get_tree().get_nodes_in_group("Cronometro")[0].text = str(tiempo / 60) + " " + str(tiempo%60)
	life -= 1
	get_tree().get_nodes_in_group("LifeBar")[0].value = life
	if get_tree().get_nodes_in_group("LifeBar")[0].value == 0:
		get_tree().change_scene_to(dead_scene)
	

func Time_end():
	life = 0
	get_tree().get_nodes_in_group("LifeBar")[0].value = life
	if get_tree().get_nodes_in_group("LifeBar")[0].value == 0:
		get_tree().change_scene_to(dead_scene)

func Go_next():
	if esena == 1:
		get_tree().change_scene_to(pasillo2_scene)
	else:
		get_tree().change_scene_to(pasillo1_scene)		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
