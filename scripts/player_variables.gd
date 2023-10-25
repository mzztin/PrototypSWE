extends Node

var speed = 100

var field_of_view = 1.5 # Zoom Niveau

var current_level = 0
var hp: int = 100
var immobile: bool = false
var inventory = []

var current_map_size = Vector2(600, 600)
var map_option = false
