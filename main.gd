extends TileMap

@onready var player: CharacterBody2D = $Player
@onready var grid_helper: Sprite2D = $GridHelper

var currentSeed = preload("res://flowers/varieties/daisy.tscn")

func _physics_process(_delta):
	var playerMapCoord = local_to_map(player.global_position)
	var playerDir = player.direction
	var playerMapsCoord = playerMapCoord + Vector2i(playerDir) / 32
	grid_helper.global_position = map_to_local(playerMapsCoord)



func _on_player_plant_seed():
	var cellLocalCoord = local_to_map(grid_helper.global_position)
	var tile: TileData = get_cell_tile_data(1, cellLocalCoord)
	
	if tile == null or currentSeed == null:
		return
	
	if tile.get_custom_data("garden"):
		plant_seed(cellLocalCoord)
		
func plant_seed(coord) -> void:
	var plant = currentSeed.instantiate()
	add_child(plant)
	plant.global_position = map_to_local(coord)
		
