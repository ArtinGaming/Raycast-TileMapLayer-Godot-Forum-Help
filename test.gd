extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_text_edit_gutter_added():
	print("NEW LINE")


func _on_text_edit_lines_edited_from(from_line, to_line):
	print("NEW LINE", to_line)
	if to_line == 15:
		print("MAX REACHED")
		$TextEdit.editable = false

