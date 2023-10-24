extends Control

var active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(PlayerVariables.immobile)
	handle_input()

func handle_input():
	if Input.is_action_just_pressed("pause"):
		toggle()

func _on_quit_button_pressed():
	# TODO: save level & location, items
	get_tree().quit()
	
func _on_resume_button_pressed():
	toggle()

func toggle():
	if active:
		PlayerVariables.immobile = false
		hide()
		Engine.time_scale = 1
	else:
		PlayerVariables.immobile = true
		show()
		Engine.time_scale = 0
	
	active = !active
