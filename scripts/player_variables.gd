extends Node

func load():
	pass

var speed = 100

var field_of_view = 3 # Zoom Niveau

var hp: int = 100
var immobile: bool = false
var inventory = []

var current_map_size = Vector2(600, 600)

# Die verschiedene Level, 0 = Hub, 1-x sind die Level
var current_level = 1

# Position
var position = 0

# Hat der Spieler die Map auf, oder nicht
var map_option = false
# Hat der Spieler das Escape Menu auf oder nicht
var escape_option = false
