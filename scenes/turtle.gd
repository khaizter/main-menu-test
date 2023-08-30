extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

var active = false

func _process(delta):
	if animation_player.current_animation == "walk":
		position.x -= 1

func _input(event):
	if active:
		return
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if sprite.get_rect().has_point(to_local(event.position)):
			active = true
			animation_player.play("waking_up")


func _on_animation_player_animation_finished(anim_name):
	animation_player.play("walk")
