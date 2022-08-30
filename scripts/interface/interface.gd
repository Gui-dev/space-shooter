extends CanvasLayer


var score: int
onready var score_text: Label = $score_container/score_text
onready var buttons_container: Control = $buttons_container
onready var final_score: Label = $final_score
onready var health_hud: Sprite = $health
onready var animation: AnimationPlayer = $animation


func _ready() -> void:
  final_score.visible = false


func increase_score(value: int) -> void:
  score += value
  score_text.text = str(score)


func update_hud(value: int, type: String) -> void:
  match type:
    'heal':
      health_hud.frame = value
    'hurt':
      animation.play('hit')
      health_hud.frame = value


func game_over() -> void:
  final_score.text = 'Pontuação Final: ' + str(score)
  buttons_container.visible = true
  final_score.visible = true


func reset() -> void:
    score = 0
    health_hud.frame = 4
    score_text.text = str(score)
    final_score.visible = false
    
