extends Node2D

func _ready():
	$Sprite/AnimationPlayer.play("CloudCast")

var timeout = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not timeout:
		$Sprite/RayCast2D.add_child(load("res://NPCs/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true
#		$Sprite/AnimationPlayer.play("CloudCast")

func _on_Timer_timeout():
	timeout = false
