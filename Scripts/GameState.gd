extends Node

var money: int = 1000
var day: int = 1
var hud: Node = null
var timer: Timer = null

func start_timer():
	if timer: return
	timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_timer_tick)
	add_child(timer)

func _on_timer_tick():
	day += 1
	update_hud()

func update_hud():
	if hud:
		hud.update_labels(day, money)

func spend(amount: int) -> bool:
	if money >= amount:
		money -= amount
		update_hud()
		return true
	return false
