extends ParallaxBackground


export(float) var desert_speed
export(float) var cloud_speed
onready var desert: ParallaxLayer = $desert
onready var cloud: ParallaxLayer = $cloud


func _physics_process(delta: float) -> void:
  desert.motion_offset.y += desert_speed * delta
  cloud.motion_offset.y += cloud_speed * delta
