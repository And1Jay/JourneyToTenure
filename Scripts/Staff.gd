extends Node2D

var students = []

func _ready():
	for student in $Students.get_children():
		students.append(student)
		GameManager.register_student(student)

func get_selected_students():
	return students
