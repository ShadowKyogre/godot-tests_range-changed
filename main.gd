
extends Panel

# member variables here, example:
# var a=2
# var b="textvar"

onready var _progress_bar = get_node("Range")
onready var _num_value = get_node("HBoxContainer/TextEdit")

var _validator = RegEx.new()

func _init():
	_validator.compile("\\d+")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_HButtonArray_button_selected( button_idx ):
	if _validator.find(_num_value.get_text()) < 0:
		print("Invalid number")
		return
	
	var _num_value_int = int(_num_value.get_text())
	if button_idx == 0:
		_progress_bar.set_step(_num_value_int)
	elif button_idx == 1:
		_progress_bar.set_max(_num_value_int)
	elif button_idx == 2:
		_progress_bar.set_min(_num_value_int)
	elif button_idx == 3:
		_progress_bar.set_value(_num_value_int)
	else:
		pass # replace with function body

func _on_Range_value_changed( value ):
	print("-- value changed fired ---")
	get_node("ValueLabel").set_text("Value: %d" % value)


func _on_Range_changed():
	print("--- changed fired ---")
	get_node("StepLabel").set_text("Step: %d" % _progress_bar.get_step())
	get_node("MaxLabel").set_text("Max: %d" % _progress_bar.get_max())
	get_node("MinLabel").set_text("Min: %d" % _progress_bar.get_min())
