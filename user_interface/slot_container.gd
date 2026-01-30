extends PanelContainer

signal slot_selected(slot_pos)

@onready var itemInfo = $ItemInfo

var seedDataResource: SeedData




func _on_texture_button_button_down() -> void:
	if seedDataResource.seed_left(): Global.emit_signal("seed_changed", seedDataResource)
	emit_signal("slot_selected", position)
	
func update_quantity() -> void:
	itemInfo.set_label(seedDataResource.get_quantity())
	
	
