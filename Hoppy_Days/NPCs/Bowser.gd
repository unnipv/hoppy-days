extends Area2D

func _ready():
	$AnimationPlayer.play("Bowser")
func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate","hurt")
