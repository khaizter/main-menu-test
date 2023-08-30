extends CanvasLayer

@onready var main_panel = $Control/MainPanel
@onready var setting_panel = $Control/SettingsPanel

func _ready():
	main_panel.visible = true
	setting_panel.visible = false

func _on_settings_button_pressed():
	main_panel.visible = false
	setting_panel.visible = true

func _on_settings_back_button_pressed():
	main_panel.visible = true
	setting_panel.visible = false

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	print("SFX volume set to",value)

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	print("Music volume set to",value)

func _on_resolution_options_item_selected(index):
	if index == 0:
		DisplayServer.window_set_size(Vector2(800,600))
	elif index == 1:
		DisplayServer.window_set_size(Vector2(1024,768))
	elif index == 2:
		DisplayServer.window_set_size(Vector2(1280,1024))

func _on_new_game_button_pressed():
	print("New game")

func _on_load_game_button_pressed():
	print("Load game")
	
func _on_exit_button_pressed():
	get_tree().quit()

