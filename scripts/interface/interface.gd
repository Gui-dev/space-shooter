extends CanvasLayer


var score: int
onready var score_text: Label = $score_container/score_text
onready var buttons_container: Control = $buttons_container
onready var final_score: Label = $final_score


func _ready() -> void:
  final_score.visible = false


func increase_score(value: int) -> void:
  score += value
  score_text.text = str(score)


func game_over() -> void:
  final_score.text = 'Pontuação Final: ' + str(score)
  buttons_container.visible = true
  final_score.visible = true


func reset() -> void:
    score = 0
    score_text.text = str(score)
    final_score.visible = false
    
