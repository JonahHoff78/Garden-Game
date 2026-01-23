extends TileMap

@onready var player: CharacterBody2D = $World/Player
@onready var grid_helper: Sprite2D = $World/GridHelper

var currentSeed = preload("res://flowers/varieties/daisy.tscn")
var plantedFlowers: Dictionary = {}

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
		if not plantedFlowers.has(cellLocalCoord):
			plant_seed(cellLocalCoord)
		elif is_harvestable(cellLocalCoord):
			harvest_plant(cellLocalCoord)
			
func harvest_plant(key) -> void:
	var plant: Flower = plantedFlowers.get(key)
	if plant.has_method("harvest"):
		plant.harvest()
		
		
func is_harvestable(key) -> bool:
	var data = plantedFlowers.get(key)
	return data.harvest_ready if data != null else false
		
func plant_seed(coord) -> void:
	var plant = currentSeed.instantiate()
	get_node("World/Flowers").add_child(plant)
	plantedFlowers[coord] = plant
	plant.global_position = map_to_local(coord)
		
