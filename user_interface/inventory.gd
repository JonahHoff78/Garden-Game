extends PanelContainer

@export var slotScene: PackedScene
@export var seedResource: SeedResource


@onready var selector_texture = $MarginContainer/SelectorTexture
@onready var grid_container = $MarginContainer/GridContainer

func _ready():
	grid_container.columns = seedResource.get_size()
	
