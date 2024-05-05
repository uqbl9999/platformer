extends Actor

export var score := 100

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	var snap := Vector2.DOWN * 80.0
	_velocity.y = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL).y



func _on_StompDetector_body_entered(body: Node) -> void:
	var physics_body := body as PhysicsBody2D
	if physics_body.global_position.y < get_node("StompDetector").global_position.y:
		die()


func die() -> void:
	get_node("CollisionShape2D").set_deferred("disabled", true)
	queue_free()
	PlayerData.score += score
