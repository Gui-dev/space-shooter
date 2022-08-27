extends Node2D


var Player: PackedScene = preload('res://scenes/player/player.tscn')
export(Vector2) var custom_initial_position


func start_game() -> void:
  var player = Player.instance()
  player.position = custom_initial_position
  get_tree().root.call_deferred('add_child', player)
