extends PanelContainer

@export var slotScene: PackedScene
@export var seedResource: SeedResource


@onready var selector_texture = $MarginContainer/SelectorTexture
@onready var grid_container = $MarginContainer/GridContainer

func _ready():
	grid_container.columns = seedResource.get_size()
	add_new_slot(seedResource.get_seed_list())
	
func add_new_slot(seedArray: Array[SeedData]) -> void:
	for child in seedArray:
		instance_slot(child)
		
func _on_slot_selected(value) -> void:
	change_selected_slot(value)
	
func change_selected_slot(slot_pos) -> void:
	selector_texture.position.x = slot_pos.x

func instance_slot(seedData: SeedData) -> void:
	var slot = slotScene.instantiate()
	grid_container.add_child(slot)
	slot.connect("slot_selected", _on_slot_selected)
	slot.setup(seedData)
