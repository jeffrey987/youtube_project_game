extends Timer

var Cherry=preload("res://Players/cherry_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_timeout() -> void:
	var cherryTemp=Cherry.instantiate()
	var rng=RandomNumberGenerator.new()
	var ranint=rng.randi_range(10,400)
	cherryTemp.position=Vector2(ranint,300)
	add_child(cherryTemp)
