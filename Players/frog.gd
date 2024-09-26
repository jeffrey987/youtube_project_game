extends CharacterBody2D

var SPEED=50
var player
@onready var frogAnimated=get_node("AnimatedSprite2D")
var chase=false
var status=0

func _physics_process(delta: float) -> void:	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if chase == true and status>=0: 
		frogAnimated.play("Jump")
		player=get_node("../../Player/Player")
		var direction=(player.position-self.position).normalized()
		#判断左右移动是否反转
		if direction.x >0:		
			frogAnimated.flip_h=true
		else:	
			frogAnimated.flip_h=false
		velocity.x =direction.x*SPEED
		
	elif chase ==false and status >=0:
		frogAnimated.play("Idle")
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
		status=-1 
		death()
	pass # Replace with function body.


func _on_player_collison_body_entered(body: Node2D) -> void:
	if body.name =="Player":		
		chase=false
		status=-1 
		Game.PlayerHP-=3
		death()
	pass # Replace with function body.

func death():
	Game.Gold+=5		
	frogAnimated.play("Death")
	await frogAnimated.animation_finished
	self.queue_free()
	pass
	
