extends Node2D 

var hud  # Declare HUD as a global variable

func _ready():
	# Load Background FIRST so other elements appear on top
	var background = load("res://Scenes/Background.tscn").instantiate()
	add_child(background)

	# Load Lab
	var lab = load("res://Scenes/Lab.tscn").instantiate()
	add_child(lab)

	# Load Professor
	var professor = load("res://Scenes/Professor.tscn").instantiate()
	add_child(professor)

	# DEBUG: Print to check if loaded
	print("Lab loaded:", lab)
	print("Professor loaded:", professor)

	# Load Conference Panel
	var conference_panel = load("res://Scenes/ConferencePanel.tscn").instantiate()
	$UI.add_child(conference_panel)

	# Load HUD
	hud = load("res://Scenes/HUD.tscn").instantiate()
	$UI.add_child(hud)

	# Connect HUD to Professor
	professor.hud = hud
	professor.update_hud()
