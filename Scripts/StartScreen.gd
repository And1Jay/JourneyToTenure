extends Control

@onready var name_input = $VBoxContainer/LineEdit
@onready var envelope = $Envelope
@onready var letter_panel = $LetterPanel
@onready var letter_text = $LetterPanel/RichTextLabel
@onready var input_ui = $VBoxContainer

var confirmed_name = ""

func _ready():
	envelope.hide()
	letter_panel.hide()

func _on_ConfirmButton_pressed():
	confirmed_name = name_input.text.strip_edges()
	if confirmed_name != "":
		input_ui.hide()
		envelope.show()

func _on_Envelope_pressed():
	envelope.hide()
	letter_panel.show()
	letter_text.text = "Dear %s,\n\nWe are pleased to offer you a research lab and funding to pursue your academic goals at our university.\n\nWelcome aboard!\n" % confirmed_name
	
	await get_tree().create_timer(3.0).timeout
	var main_scene = load("res://Scenes/Main.tscn")
	get_tree().change_scene_to_packed(main_scene)
