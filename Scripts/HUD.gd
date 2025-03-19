extends Control

@onready var social_skill_label = $VBoxContainer/SocialSkillLabel
@onready var inspiration_label = $VBoxContainer/InspirationLabel

func update_stats(social_skill: int, inspiration: int):
	social_skill_label.text = "Social Skill: " + str(social_skill)
	inspiration_label.text = "Inspiration: " + str(inspiration)
