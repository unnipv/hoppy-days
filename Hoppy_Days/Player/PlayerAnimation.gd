extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump")
	elif motion.y == 0 and motion.x == 0:
		play("idle")
	elif motion.y == 0 and motion.x > 0:
		flip_h = false
		play("walk")
	elif motion.y ==0 and motion.x < 0:
		flip_h = true
		play("walk")
