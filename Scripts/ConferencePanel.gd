extends Control 

@onready var title_label = $VBoxContainer/TitleLabel
@onready var region_selection = $VBoxContainer/RegionSelection
@onready var tier_selection = $VBoxContainer/TierSelection
@onready var results_label = $VBoxContainer/ResultsLabel
@onready var attend_button = $VBoxContainer/AttendButton
@onready var panel = $VBoxContainer  # Reference to keep size static

func _ready():
	region_selection.add_item("Asia")
	region_selection.add_item("Europe")
	region_selection.add_item("North America")

	tier_selection.add_item("Tier 1")
	tier_selection.add_item("Tier 2")
	tier_selection.add_item("Tier 3")

	# Set text alignment for label and option buttons
	title_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	region_selection.add_theme_constant_override("align", HORIZONTAL_ALIGNMENT_CENTER)
	tier_selection.add_theme_constant_override("align", HORIZONTAL_ALIGNMENT_CENTER)

	# Connect button to function
	attend_button.pressed.connect(_on_AttendButton_pressed)

func _on_AttendButton_pressed():
	var selected_tier = tier_selection.selected + 1
	var selected_region = region_selection.get_item_text(region_selection.selected)

	if GameManager.professor:
		var gained_inspiration = GameManager.attend_conference(selected_tier, selected_region)
		results_label.text = "+ %d %s inspiration" % [gained_inspiration, selected_region]
		
		# Ensure results_label does NOT expand UI
		results_label.size.x = 250  # Match min width
	else:
		results_label.text = "Error: No professor!"
