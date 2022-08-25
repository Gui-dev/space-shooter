extends Position2D
class_name SpawnShoot


var Shoot: PackedScene = preload('res://scenes/player/shot.tscn')


func _physics_process(_delta: float) -> void:
  if Input.is_action_just_pressed('ui_attack'):
    var shoot = Shoot.instance()
    shoot.global_position = global_position
    get_tree().root.call_deferred('add_child', shoot)
