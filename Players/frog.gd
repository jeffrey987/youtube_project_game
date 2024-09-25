extends CharacterBody2D
var SPEED=50
var player
var chase=false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if chase == true: 
		get_node("AnimatedSprite2D").play("Jump")
		player=get_node("../../Player/Player")
		var direction=(player.position-self.position).normalized()
		#判断左右移动是否反转
		if direction.x >0:		
			get_node("AnimatedSprite2D").flip_h=true
		else:	
			get_node("AnimatedSprite2D").flip_h=false
		velocity.x =direction.x*SPEED
		
	else:
		get_node("AnimatedSprite2D").play("Idle")
		velocity.x=0
	
	move_and_slide()
	pass

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name =="Player":
		chase=true
	pass # Replace with function body.


func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name =="Player":
		chase=false
	pass # Replace with function body.


func _on_player_death_body_entered(body: Node2D) -> void:
	if body.name =="Player":
		chase=false
		get_node("AnimatedSprite2D").play("Death")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
	pass # Replace with function body.
