extends StaticBody2D

@onready var candlelight = $CandleLight;
@onready var lit_sprite = $Lit_sprite;
@onready var fire = $Fire;
@onready var firesound = $AudioStreamPlayer2D

signal start_game;
signal end_game;
signal candle_lit;

@export var FIRST_CANDLE = false;
@export var LAST_CANDLE = false;
@export var STABLE_CANDLE_BRIGHTNESS = 2;
@export var CANDLE_RECOVERY = 0.02;
@export var CANDLE_STABLE_CHANGE = 0.02 ;

var is_lit = false

var current_candle_brightness = 0;

func _ready() -> void:
	fire.visible = false
	if is_lit:
		current_candle_brightness = STABLE_CANDLE_BRIGHTNESS
		#lit_sprite.visible = true

func _process(_delta: float) -> void:
	if is_lit:
		if current_candle_brightness != STABLE_CANDLE_BRIGHTNESS:
			current_candle_brightness +=  (STABLE_CANDLE_BRIGHTNESS - current_candle_brightness)*CANDLE_RECOVERY
		
		#add some randomness
		current_candle_brightness += randf_range(-CANDLE_STABLE_CHANGE, CANDLE_STABLE_CHANGE) * current_candle_brightness
		
		candlelight.energy = current_candle_brightness

func light():
	firesound.play()
	is_lit = true
	fire.visible = true
	#lit_sprite.visible = true
	emit_signal('candle_lit')
	if FIRST_CANDLE:
		emit_signal('start_game')
	if LAST_CANDLE:
		emit_signal('end_game')
