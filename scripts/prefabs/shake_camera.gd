extends Camera2D


var shake_strength: int
var shake_remaining_time: float
var is_shaking: bool
export(Vector2) var base_position


func _ready() -> void:
  pass


func shake(new_shake_strength: int, shake_lifetime: float) -> void:
  if shake_strength > new_shake_strength:
    return
    
  shake_strength = new_shake_strength
  shake_remaining_time = shake_lifetime
  
  if is_shaking:
    return
  
  is_shaking = true
  
  while shake_remaining_time > 0:
    var shake_position = Vector2.ZERO
    shake_position.x = rand_range(-shake_strength, shake_strength)
    set_position(base_position + shake_position)
    shake_remaining_time -= get_process_delta_time()
    yield(get_tree(), 'idle_frame')
    
  shake_strength = 0
  is_shaking = false
  set_position(base_position)
  
