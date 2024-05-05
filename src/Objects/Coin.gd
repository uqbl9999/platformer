extends Area2D


onready var animation_player := $AnimationPlayer
export var score := 100


func _on_Coin_body_entered(body: Node) -> void:
	picked()


func picked() -> void:
	PlayerData.score += score
	animation_player.play("fade_out")
	
