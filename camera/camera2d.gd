extends Camera2D

export var target_path: NodePath

onready var target_node := get_node(target_path)

func _ready():
	self.position = target_node.position

func _physics_process(delta):
	self.position = target_node.position
