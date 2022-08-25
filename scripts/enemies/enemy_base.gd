extends Area2D
class_name Enemy


var ExplosionFX: PackedScene = preload('res://scenes/prefabs/explosion.tscn')
var HitSFX: PackedScene = preload('res://scenes/prefabs/hit_enemy_sfx.tscn')
var can_increase_score = false
onready var notifier: VisibilityNotifier2D = $notifier
export(Vector2) var velocity
export(Vector2) var custom_explosion_scale
export(int) var collision_damage
export(int) var health
export(int) var score


func _ready() -> void:
  var _connect = notifier.connect('screen_exited', self, 'queue_free')


func _physics_process(_delta: float) -> void:
  translate(velocity)


func _create_explosion() -> void:
  var explosion_fx = ExplosionFX.instance()
  explosion_fx.scale = custom_explosion_scale
  explosion_fx.global_position = global_position
  get_tree().root.call_deferred('add_child', explosion_fx)
  queue_free()


func _update_health(damage: int) -> void:
  health -= damage
  _hit_sfx()
  
  if health <= 0:
    can_increase_score = true
    _create_explosion()


func _hit_sfx() -> void:
  var hit_sfx = HitSFX.instance()
  get_tree().root.call_deferred('add_child', hit_sfx)


func _on_area_entered(area: Area2D) -> void:
  if area.is_in_group('player'):
    _create_explosion()
    
  if area.is_in_group('shot'):
    _update_health(area.damage)
