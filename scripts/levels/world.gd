extends Node2D


var Player: PackedScene = preload('res://scenes/player/player.tscn')
onready var interface: CanvasLayer = $interface
onready var enemies_spawner: Position2D = $enemy_spawner
onready var power_up_spawner: Position2D = $power_up_spawner
export(Vector2) var custom_initial_position


func start_game() -> void:
  interface.reset()
  var player = Player.instance()
  player.position = custom_initial_position
  player.connect('game_over', interface, 'game_over')
  player.connect('game_over', enemies_spawner, 'game_over')
  player.connect('game_over', power_up_spawner, 'game_over')
  get_tree().root.call_deferred('add_child', player)
