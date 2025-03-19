extends CharacterBody2D

@export var social_skill: int = 5
@export var inspiration: int = 10
var hud  # Reference to HUD

func _ready():
	GameManager.register_professor(self)

func attend_conference(tier: int, region: String):
	var base_inspiration = tier * 5
	var social_bonus = social_skill * 2
	var total_inspiration = base_inspiration + social_bonus

	inspiration += total_inspiration
	update_hud()  # Update UI after change
	return total_inspiration

func update_hud():
	if hud:
		hud.update_stats(social_skill, inspiration)
