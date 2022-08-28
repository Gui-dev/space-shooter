extends Area2D
class_name Player

signal game_over
var ExplosionHitFX: PackedScene = preload('res://scenes/prefabs/explosion.tscn')
var HitSFX: PackedScene = preload('res://scenes/prefabs/hit_sfx.tscn')
onready var animation_tree: AnimationTree = $animation_tree
onready var x_screen_size: int = get_viewport().get_visible_rect().size.x
export(Vector2) var velocity
export(Vector2) var custom_explosion_scale
export(int) var health
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


func _update_health(damage: int, type: String) -> void:
  match type:
    'hurt':
      if health > 0:
        _hit_sfx()
        health -= damage
      
  get_tree().call_group('interface', 'update_hud', health, type)
        
  if health <= 0:
    _create_explosion()


func _hit_sfx() -> void:
  var hitSFX = HitSFX.instance()
  get_tree().root.call_deferred('add_child', hitSFX)


func _create_explosion() -> void:
  var explosionHitFX = ExplosionHitFX.instance()
  explosionHitFX.global_position = global_position
  explosionHitFX.scale = custom_explosion_scale
  get_tree().root.call_deferred('add_child', explosionHitFX)
  _kill()


func _kill() -> void:
  emit_signal('game_over')
  queue_free()


func _on_player_area_entered(area: Area2D) -> void:
  if area.is_in_group('enemy_shot'):
    _update_health(area.damage, 'hurt')
  else:
    _update_health(area.collision_damage, 'hurt')
