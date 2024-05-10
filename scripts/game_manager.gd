extends Node

var score = 0

@onready var coin_counter = $UI/Control/MarginContainer/CoinCounter
@onready var message = $UI/Control/MarginContainer/Message

func add_point():
	score += 1
	coin_counter.text = str(score)

func show_message(msg):
	message.visible = true
	message.text = msg 
	message.get_node("Timer").start()

func _on_timer_timeout():
	message.visible = false
