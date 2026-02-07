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
	inventory.initialize()
	
func inventory_slot_empty(seed) -> void:
	inventory.is_slot_empty(seed)
	
	
func update_ui(value) -> void:
	flourist_shop.visible = value
	inventory.visible = not value


func _on_texture_button_button_down():
	if not flourist_shop.visible:
		flourist_shop.scale = Vector2.ZERO
		var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_callback(update_ui.bind(true))
		tween.tween_property(flourist_shop, "scale", Vector2(1,1), 0.25)
	
	
	

