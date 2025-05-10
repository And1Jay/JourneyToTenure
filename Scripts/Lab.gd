extends Node2D

@onready var desk_container = $DeskContainer
@onready var money_label = $CanvasLayer/MoneyLabel
@onready var time_label = $CanvasLayer/TimeLabel

var money = 1000
var day = 1
var desks = []

func _ready():
	# Start time update
	update_hud()
	_start_timer()
	
	# Initialize desk slots
	for desk_slot in desk_container.get_children():
		desks.append(false)  # False means no computer yet
		var label = desk_slot.get_node("PlaceholderLabel")
		label.text = "Buy PC"
		label.mouse_filter = Control.MOUSE_FILTER_PASS
		label.connect("gui_input", _on_desk_clicked.bind(desk_slot))

func _on_desk_clicked(event: InputEvent, desk_slot):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var idx = desk_container.get_children().find(desk_slot)
		if desks[idx] == false and money >= 500:
			money -= 500
			desks[idx] = true
			desk_slot.get_node("PlaceholderLabel").text = "🖥️ PC Ready"
			update_hud()

func update_hud():
	money_label.text = "Money: $" + str(money)
	time_label.text = "Day: " + str(day)

func _start_timer():
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_timer_tick)

func _on_timer_tick():
	day += 1
	update_hud()
