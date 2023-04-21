extends Area2D

var next_scene = preload("res://Pasillo.tscn")
#var nexxt_scene = preload("res://Menu.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Puerta_body_entered(body):
	if (body.get_name() == "Player"):
		get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").stop()
		get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").stop()
		get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").stop()
		get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").stop()
		get_tree().change_scene_to(next_scene)
#		get_tree().change_scene_to(nexxt_scene)
	pass # Replace with function body.
