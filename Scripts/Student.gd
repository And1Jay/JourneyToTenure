extends Control

@export var inspiration: int = 0

func increase_inspiration(value: int):
	inspiration += value
	update_label()
	print("Student", self.name, "inspiration increased to:", inspiration)

func update_label():
	var label = get_node("Label") if has_node("Label") else null
	if label:
		label.text = "Inspiration: " + str(inspiration)
