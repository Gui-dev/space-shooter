extends Area2D
class_name Shot


export(Vector2) var direction
export(int) var damage


func _physics_process(_delta: float) -> void:
  translate(direction)


func _on_area_entered(area: Area2D) -> void:
  if area.is_in_group('enemy'):
    queue_free()


func _on_notifier_screen_exited() -> void:
  queue_free()
