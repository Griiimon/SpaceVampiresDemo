class_name DebugComponentProgressBar
extends PanelContainer

@onready var progress_bar: ProgressBar = %ProgressBar



func set_ratio(f: float):
	progress_bar.value= f
