extends Area2D


var Explosion: PackedScene = preload('res://scenes/prefabs/explosion.tscn')
var PowerUpSFX: PackedScene = preload('res://scenes/prefabs/power_up_sfx.tscn')
export(Vector2) var velocity
export(int) var heal


func _physics_process(_delta: float) -> void:
  translate(velocity)
  

func create_explosion() -> void:
  var explosion = Explosion.instance()
  explosion.global_position = global_position
  get_tree().root.call_deferred('add_child', explosion)
  queue_free()


func _on_power_up_area_entered(_area: Area2D) -> void:
  var power_up_sfx = PowerUpSFX.instance()
  get_tree().root.call_deferred('add_child', power_up_sfx)
  queue_free()
