extends Position2D


signal kill
onready var timer: Timer = $timer
export(Array, PackedScene) var enemy_ships
export(float) var spawn_cooldown


func start_game() -> void:
  timer.set_wait_time(spawn_cooldown)
  timer.start()


func _spawn() -> void:
  randomize()
  _set_spawn_position()
  var random_pick = randi() % enemy_ships.size()
  var choosen_scene = enemy_ships[random_pick].instance()
  choosen_scene.global_position = global_position
  var _connection = connect('kill', choosen_scene, 'create_explosion')
  get_tree().root.call_deferred('add_child', choosen_scene)
  timer.start()
  

func _set_spawn_position() -> void:
  var random_spawn_position = rand_range(32, 328)
  position = Vector2(random_spawn_position, -30)


func game_over() -> void:
  emit_signal('kill')
  timer.stop()


func _on_timer_timeout() -> void:
  _spawn()
