extends Node2D

@onready var desk_container = $DeskContainer

var desks = []

func _ready():
	for desk_slot in desk_container.get_children():
		desks.append(false)
		var label = desk_slot.get_node("PlaceholderLabel")
		label.text = "Buy PC"
		label.mouse_filter = Control.MOUSE_FILTER_PASS
		label.connect("gui_input", _on_desk_clicked.bind(desk_slot))

func _on_desk_clicked(event: InputEvent, desk_slot):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var idx = desk_container.get_children().find(desk_slot)
		if desks[idx] == false and GameState.spend(500):
			desks[idx] = true
			desk_slot.get_node("PlaceholderLabel").text = "🖥️ PC Ready"
