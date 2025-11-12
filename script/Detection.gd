extends Area3D

func _ready():
	print("DoorSensor ready!")
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == "player":  # or check for a specific group
		print("Player entered the door sensor!")

func _on_body_exited(body):
	if body.name == "player":
		print("Player exited the door sensor!")
