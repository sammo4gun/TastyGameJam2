extends Node2D

# handle all the 'lightning' effects

var LIGHTNING_BASE_ENERGY = 11;
var LIGHTNING_STOP_CHANCE = 0.85;

var LIGHTNING_FREQ = 0.99;

var rng = RandomNumberGenerator.new()

var lightning_check_every = 0.1
var all_lights;
var moonlight_base_energy;

var doing_lightning = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_lights = get_children()
	moonlight_base_energy = all_lights[0].get_child(0).energy

var t = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not doing_lightning:
		if t < lightning_check_every:
			t+= delta
		else:
			t = 0
			if rng.randf() > LIGHTNING_FREQ:
				do_lightning()
	if doing_lightning:
		if t < lightning_check_every:
			t+= delta
		else:
			t = 0
			if rng.randf() > LIGHTNING_STOP_CHANCE:
				stop_lightning()
		

func do_lightning():
	doing_lightning = true
	var rand_fact = randf_range(0.6,1.4)
	for child in all_lights:
		child.get_child(0).energy = 0
		child.get_child(1).energy = LIGHTNING_BASE_ENERGY * rand_fact


func stop_lightning():
	doing_lightning = false
	for child in all_lights:
		child.get_child(0).energy = moonlight_base_energy
		child.get_child(1).energy = 0
