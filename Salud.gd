extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Salud_area_entered(area):
	if ("CuerpoPlayer" in area.get_name()):
		Resources.pills += 10
		Resources.Life_Box()
		self.queue_free()
	pass # Replace with function body.
