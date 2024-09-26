extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if name=="hp":
		text ="HP: "+str(Game.PlayerHP)
	if name=="gold":
		text ="Gold: "+str(Game.Gold)
	pass
