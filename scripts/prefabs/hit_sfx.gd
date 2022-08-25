extends AudioStreamPlayer2D
class_name HitSFX


func _on_sfx_finished() -> void:
  queue_free()
