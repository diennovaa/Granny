extends Node3D

@export var patient_scene: PackedScene
@onready var summon_pos: Node3D = $summonPos
@onready var move_pos: Node3D = $movePos   # 👈 add this line
@onready var hospital_scene: Node3D = $"../hospital"   # path to where NavigationRegion3D lives

@export var spawn_interval: float = 5.0
@export var max_patients: int = 10

var spawn_timer: float = 0.0
var current_patients: int = 0

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		if current_patients < max_patients:
			spawn_patient()

func spawn_patient():
	var patient = patient_scene.instantiate()
	hospital_scene.add_child(patient)  # 👈 instead of current_scene
	patient.global_transform.origin = summon_pos.global_transform.origin
	current_patients += 1

	if move_pos and patient.has_method("move_to_location"):
		patient.move_to_location(move_pos.global_transform.origin)
