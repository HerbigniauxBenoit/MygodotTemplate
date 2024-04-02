extends Node2D

@onready var overlay: FadeOverlay = %FadeOverlay
@onready var return_button: Button = %ReturnButton

func _ready() -> void:
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)
	return_button.pressed.connect(_on_return_button_pressed)

	overlay.visible = true
	return_button.grab_focus()

func _on_fade_overlay_on_complete_fade_out() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")

func _on_return_button_pressed() -> void:
	overlay.fade_out()
