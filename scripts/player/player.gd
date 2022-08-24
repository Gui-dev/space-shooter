extends Area2D
class_name Player


onready var animation_tree: AnimationTree = $animation_tree
onready var x_screen_size: int = get_viewport().get_visible_rect().size.x
export(Vector2) var velocity
export(float) var speed


func _physics_process(_delta: float) -> void:
  _move()
  _verify_position()


func _move() -> void:
  velocity.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
  velocity.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
  velocity = velocity.normalized()
  animation_tree.set('parameters/blend_position', velocity.x)
  translate(velocity * speed)
  

func _verify_position() -> void:
  var x_form = get_transform()
  
  if x_form.origin.x > x_screen_size:
    x_form.origin.x = 0
    
  if x_form.origin.x < 0:
    x_form.origin.x = x_screen_size
    
  set_transform(x_form)
