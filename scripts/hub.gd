extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_map_input()
	handle_camera()
			
func handle_map_input():
	if Input.is_action_just_pressed("map"):
		PlayerVariables.map_option = !PlayerVariables.map_option
	
func handle_camera():
	if PlayerVariables.map_option:	
		$MapView/Camera2D.make_current()
	else:
		$Player/Camera2D.make_current()
