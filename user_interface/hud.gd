extends CanvasLayer

@onready var flourist_shop = $FlouristShop
@onready var inventory = $Inventory


@onready var screenSize = get_viewport().get_visible_rect().size

var inventory_hidden: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggleInventory") and not flourist_shop.visible:
		inventory_hidden = not inventory_hidden
		toggle_inventory_ui()
		
func toggle_inventory_ui() -> void:
	create_tween().set_ease(Tween.EASE_IN_OUT).tween_property(
		inventory, "position:y",
		screenSize.y + inventory.size.y if inventory_hidden else screenSize.y - inventory.size.y, 
		0.5
	)

func setup_inventory() -> void:
	$Inventory.initialize()
	
func inventory_slot_empty(seed) -> void:
	$Inventory.is_slot_empty(seed)
