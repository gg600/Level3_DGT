extends Node

signal language_changed

var current_language := "en"

func set_language(language: String):
	if current_language == language:
		return

	current_language = language
	language_changed.emit()
