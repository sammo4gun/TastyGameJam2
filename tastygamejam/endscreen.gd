extends Control

@export var time_to_fade_out = 2
@export var wait_after_fade = 1.5

@onready var modulator = $CanvasModulate
@onready var text = $RichTextLabel

var start_game = false

var t = 0

func _ready() -> void:
	print(global.candles_done)
	text.text = str(global.candles_done) + " out of fifteen candles were lit."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start_game and t < time_to_fade_out+wait_after_fade:
		if t < time_to_fade_out:
			modulator.color = Color(
				1-(1*(t/time_to_fade_out)),
				1-(1*(t/time_to_fade_out)),
				1-(1*(t/time_to_fade_out)),
				1
			)
		t += delta
		if t >=  time_to_fade_out+wait_after_fade:
			get_tree().change_scene_to_file("res://game.tscn")

func _on_button_pressed() -> void:
	start_game = true
