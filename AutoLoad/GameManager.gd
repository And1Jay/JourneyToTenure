extends Node

var professor
var students = []

func register_professor(prof):
	professor = prof
	print("Professor registered:", professor)

func register_student(student):
	if student and student.has_method("increase_inspiration"):  # Ensure it's a valid student
		students.append(student)
		print("Registered student:", student)
	else:
		print("Warning: Attempted to register an invalid student:", student)

func attend_conference(tier: int, region: String) -> int:
	if professor:
		var inspiration_gain = professor.attend_conference(tier, region)
		print("Professor gained", inspiration_gain, "inspiration from", region, "conference.")
		
		for student in students:
			if student.has_method("increase_inspiration"):
				student.increase_inspiration(inspiration_gain / 2)  # Students get half
				print("Student", student, "gained", inspiration_gain / 2, "inspiration.")
			else:
				print("Error: Student does not have increase_inspiration()", student)
		
		return inspiration_gain
	else:
		print("Error: No professor found")
		return 0
