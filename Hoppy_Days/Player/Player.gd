extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 500
const GRAVITY = 250
const UP = Vector2(0,-1)
const JUMP_SPEED = 3000

signal animate

func _physics_process(delta):
	apply_gravity()
	bunny_jump()
	move()
	animate()
	move_and_slide(motion,UP)

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY

func bunny_jump():
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			motion.y -= JUMP_SPEED

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate",motion)
#	 
