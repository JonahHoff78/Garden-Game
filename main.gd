extends TileMap
@onready var player: CharacterBody2D = $Player
@onready var grid_helper: Sprite2D = $GridHelper

func _physics_process(_delta):
	var playerMapCoord = local_to_map(player.global_position)
	var playerDir = player.direction
	var playerMapsCoord = playerMapCoord + Vector2i(playerDir) / 32
	grid_helper.global_position = playerMapCoord * 16
