extends Area2D

export var jump_bumper := 5000.0

func _on_Area2D_body_entered(body: Node) -> void:
	var physics_body := body as PhysicsBody2D
	physics_body._velocity.y = jump_bumper
