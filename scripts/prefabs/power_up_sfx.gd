extends AudioStreamPlayer2D


func _on_power_up_sfx_finished() -> void:
  queue_free()
