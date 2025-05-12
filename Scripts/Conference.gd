extends Node2D 

var skill

func _ready():
	var background = load("res://Scenes/Background.tscn").instantiate()
	add_child(background)

	# For testing only Conference
	# var lab = load("res://Scenes/Lab.tscn").instantiate()
	# add_child(lab)

	var professor = load("res://Scenes/Professor.tscn").instantiate()
	add_child(professor)

	var conference_panel = load("res://Scenes/ConferencePanel.tscn").instantiate()
	$UI.add_child(conference_panel)

	skill = load("res://Scenes/Skill.tscn").instantiate()
	$UI.add_child(skill)

	var staff = load("res://Scenes/Staff.tscn").instantiate()
	add_child(staff)

	professor.skill = skill
	professor.update_skill()
