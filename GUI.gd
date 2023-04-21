extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	$LifeBar.max_value = Resources.Max_life
	$LifeBar.value = Resources.life
	$Points.text = str(Resources.points) + " Points"
	$Pills.text = str(Resources.pills) + " Pills"
	$Cronometro.text = str(Resources.tiempo / 60) + " " + str(Resources.tiempo%60)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if Resources.tiempo > 0:
		$Points.text = str(Resources.points) + " Points"
		$LifeBar.value = Resources.life
		Resources.Update_Cronometro()
	else:
		Resources.Time_end()
#		$LifeBar.value = Resources.life
#		Resources.tiempo -= 1
#		$Cronometro.text = str(Resources.tiempo / 60) + " " + str(Resources.tiempo%60)
##	else:
#		get_tree().Menu
	pass # Replace with function body.
