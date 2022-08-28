extends AnimatedSprite
class_name Explosion


func _ready() -> void:
  play('idle')


func _on__animation_finished() -> void:
  queue_free()
