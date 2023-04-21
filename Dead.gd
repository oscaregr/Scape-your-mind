extends Node

var grito = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var menu_scene = preload("res://Menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if grito:
		grito = false
		get_tree().get_nodes_in_group("Sonidos")[0].get_node("5").play()
	
	if !get_tree().get_nodes_in_group("Sonidos")[0].get_node("5").is_playing():
		get_tree().change_scene_to(menu_scene)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
