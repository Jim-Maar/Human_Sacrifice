extends Node2D

var max_deaths
var death_count

signal player_died

func _ready():
    player_died.connect(on_player_death())
    death_count = 0
    pass # Replace with function body.


func _process(delta):
    if death_count > max_deaths:
        get_tree().reload_current_scene()
    pass

func on_player_death():
    death_count += 1