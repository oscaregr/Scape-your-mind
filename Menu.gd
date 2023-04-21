extends Node

var first_scene = preload("res://Main.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		
	pass # Replace with function body.

func _physics_process(delta):
		
	if !get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").is_playing():
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").play()
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").stop()
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").stop()
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").stop()
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").stop()
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").stop()
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").stop()
	get_tree().change_scene_to(first_scene)
	pass # Replace with function body.
