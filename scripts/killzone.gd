extends Area2D

@onready var game_manager = %GameManager
@onready var timer = $Timer

func _on_body_entered(body):
	# `%GameManager` should be accessible from anywhere, but for some reason
	# it is `null` when you collide with Slime :/
	# TODO: Fix null reference to %GameManager
	if (game_manager != null):
		game_manager.show_message("YOU DIED!")
	Engine.time_scale = 0.5
	body.velocity.y = -300.0
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	
