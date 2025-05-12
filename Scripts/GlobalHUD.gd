extends CanvasLayer

@onready var money_label = $MoneyLabel
@onready var time_label = $TimeLabel

func update_labels(day: int, money: int):
	money_label.text = "Money: $" + str(money)
	time_label.text = "Day: " + str(day)
