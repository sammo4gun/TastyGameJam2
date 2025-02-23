extends Camera2D

func _ready() -> void:
	var player = get_node("../Player")
	position.y = player.position.y
	position.x = player.position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var player = get_node("../Player")

	# Make sure the player node exists
	if player:
		# Set the camera's X position to follow the player, but keep the Y position fixed
		position.x = player.position.x
		position.y = player.position.y
		# You can keep the Y position constant, for example, you can set it to a fixed value like:
		
