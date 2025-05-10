extends Node2D

@onready var lab_container = $LabContainer
@onready var conference_container = $ConferenceContainer
@onready var switch_button = $Control/SwitchButton

var lab_scene = preload("res://Scenes/Lab.tscn")
var conference_scene = preload("res://Scenes/Conference.tscn")

var current_scene = null

func _ready():
	switch_button.pressed.connect(_on_switch_pressed)
	_show_conference()

func _on_switch_pressed():
	if current_scene.name == "Conference":
		_show_lab()
	else:
		_show_conference()

func _show_conference():
	lab_container.get_children().map(func(c): c.queue_free())
	current_scene = conference_scene.instantiate()
	conference_container.add_child(current_scene)
	switch_button.text = "Go to Lab"

func _show_lab():
	conference_container.get_children().map(func(c): c.queue_free())
	current_scene = lab_scene.instantiate()
	lab_container.add_child(current_scene)
	switch_button.text = "Go to Conference"
