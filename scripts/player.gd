extends CharacterBody2D


enum Direction { UP, DOWN, RIGHT, LEFT, NONE }
enum AnimationType { IDLE, WALK }

var current_dir: Direction = Direction.NONE
var minimap: bool = false


func _ready():
	$AnimatedSprite2D.play("down_idle") # damit wir nicht statisch starten
#	$EscapeMenu.hide()

func _physics_process(delta):
	player_movement(delta)

func _process(delta):
	handle_escape()
	update_developer_information()
	handle_fov()
	handle_immobile()
	
func player_movement(delta):
	if PlayerVariables.immobile:
		return
	
	if Input.is_action_pressed("right"):
		current_dir = Direction.RIGHT
		velocity.x = PlayerVariables.speed
		velocity.y = 0
		play_animation(AnimationType.WALK)
	elif Input.is_action_pressed("left"):
		current_dir = Direction.LEFT
		velocity.x = -PlayerVariables.speed
		velocity.y = 0
		play_animation(AnimationType.WALK)
	elif Input.is_action_pressed("up"):
		current_dir = Direction.UP
		velocity.x = 0
		velocity.y = -PlayerVariables.speed
		play_animation(AnimationType.WALK)
	elif Input.is_action_pressed("down"):
		current_dir = Direction.DOWN
		velocity.x = 0
		velocity.y = PlayerVariables.speed
		play_animation(AnimationType.WALK)
	else:
		velocity.x = 0
		velocity.y = 0
		play_animation(AnimationType.IDLE)
		
	move_and_slide()

func handle_escape():
	if Input.is_action_just_pressed("pause"):
		pass
		#$EscapeMenu.toggle()

func play_animation(type: AnimationType):
	var dir: Direction = current_dir
	var anim: AnimatedSprite2D = $AnimatedSprite2D
	
	if dir == Direction.RIGHT:
		anim.flip_h = false # Flip H => Horizontal den Charachter rotieren
		if type == AnimationType.WALK:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	
	if dir == Direction.LEFT:
		anim.flip_h = true # Flip H => Horizontal den Charachter rotieren
		if type == AnimationType.WALK:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	if dir == Direction.UP:
		anim.flip_h = false # Flip H => Horizontal den Charachter rotieren
		if type == AnimationType.WALK:
			anim.play("up_walk")
		else:
			anim.play("up_idle")

	if dir == Direction.DOWN:
		anim.flip_h = false # Flip H => Horizontal den Charachter rotieren
		if type == AnimationType.WALK:
			anim.play("down_walk")
		else:
			anim.play("down_idle")

func update_developer_information():
	var monitor_value = Callable(self, "get_monitor_value")
	var format_string = "X: %.*f\nY: %.*f"
	$Camera2D/DeveloperInformation.text = format_string % [2, position.x, 2, position.y]

func handle_fov():
	var field_of_view = PlayerVariables.field_of_view
	$Camera2D.zoom = Vector2(1 * field_of_view, 1 * field_of_view)

func handle_immobile():
	if PlayerVariables.immobile == true:
		$AnimatedSprite2D.play("invisible")
		return	
