extends PanelContainer

signal slot_selected(slot_pos)

@onready var itemInfo = $ItemInfo

var seedDataResource: SeedData




func _on_texture_button_button_down() -> void:
	if seedDataResource.seed_left(): pass
	
	
