extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var canvas:int
export var maxLife:int
export var Life:int
export var tiempo:int
export var Next_esena:int
var cambios

# Called when the node enters the scene tree for the first time.
func _ready():
	if canvas == 1:
		Resources.Max_life = maxLife
		Resources.life = Life
		Resources.points = 0
		Resources.pills = 0
	Resources.tiempo = tiempo
	Resources.esena = Next_esena
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	
	cambios = Resources.life
	if cambios > 90:
		if !get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").is_playing():
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").play()
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").stop()
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").stop()
			get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").stop()
			
#		$lampara.visible = false
		
		if canvas == 1:
			get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara").visible = false
			$CanvasModulate1.visible = false
		else:
			$CanvasModulate1.visible = false
			$CanvasLayer2/ParallaxBackground/CanvasModulate2.visible=false
			for a in range(1, 12, 1):
					get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara" + str(a)).visible = false
	elif cambios < 90:
#		$lampara.visible = true
		
		if canvas == 1:
			get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara").visible = true
			$CanvasModulate1.visible = true
		else:
			$CanvasModulate1.visible = true
			$CanvasLayer2/ParallaxBackground/CanvasModulate2.visible=true
			for a in range(1, 12, 1):
					get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara" + str(a)).visible = true
		if cambios >= 60:
			if !get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").is_playing():
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").play()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").stop()
			if canvas == 1:
				get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara").get_node("AnimationPlayer").play("Encender")
			else:
				for a in range(1, 12, 1):
					get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara" + str(a)).get_node("AnimationPlayer").play("Encender")
#			$lampara.get_node("AnimationPlayer").play("Encender")
		elif cambios < 60 && cambios > 30:
			if !get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").is_playing():
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").play()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").stop()
			if canvas == 1:
				get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara").get_node("AnimationPlayer").play("Parpadea")
			else:
				for a in range(1, 12, 1):
					get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara" + str(a)).get_node("AnimationPlayer").play("Parpadea")
	
#			$lampara.get_node("AnimationPlayer").play("Parpadea")
		elif cambios <= 30:
			if !get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").is_playing():
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("1").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("2").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("3").stop()
				get_tree().get_nodes_in_group("Sonidos")[0].get_node("4").play()
			if canvas == 1:
				get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara").get_node("AnimationPlayer").play("Apagar")
			else:
				for a in range(1, 12, 1):
					get_tree().get_nodes_in_group("Lampara")[0].get_node("lampara" + str(a)).get_node("AnimationPlayer").play("Apagar")
#			$lampara.get_node("AnimationPlayer").play("Apagar")
