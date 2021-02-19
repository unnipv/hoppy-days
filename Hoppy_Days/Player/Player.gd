extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 700
const GRAVITY = 250
const UP = Vector2(0,-1)
const JUMP_SPEED = 4000
const WORLD_LIMIT = 3000
const BOOST_MULTIPLIER = 2.5

var lives = 3
signal animate

func _physics_process(delta):
	apply_gravity()
	bunny_jump()
	move()
	animate()
	move_and_slide(motion,UP)

func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate","end_game")
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func bunny_jump():
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			motion.y -= JUMP_SPEED
		if not $JumpSFX.playing:
			$JumpSFX.play()

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate",motion)
	


func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	$PainSFX.play()
	lives -= 1
#	if lives < 0:
#		end_game()

func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER
