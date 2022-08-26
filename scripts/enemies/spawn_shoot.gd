extends Position2D


var EnemyShot: PackedScene = preload('res://scenes/enemies/enemy_shot.tscn')
onready var timer: Timer = $timer
export(float) var shoot_cooldown


func _ready() -> void:
  timer.set_wait_time(shoot_cooldown)


func _on_timer_timeout() -> void:
  var enemy_shot = EnemyShot.instance()
  enemy_shot.global_position = global_position
  get_tree().root.call_deferred('add_child', enemy_shot)
  timer.start()


func _on_notifier_screen_entered() -> void:
  timer.start()
