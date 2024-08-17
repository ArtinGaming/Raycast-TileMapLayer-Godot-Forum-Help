extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var up_ray_cast  = $RayCast2D

var tilemap

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	print(get_clicked_tile_power())	
	
func get_clicked_tile_powere():
	if up_ray_cast.is_colliding():
		var collider = up_ray_cast.get_collider()
		
		var tile_coords = up_ray_cast.get_collider().local_to_map(to_local(up_ray_cast.get_collision_point()))
		var data = collider.get_cell_tile_data(tile_coords)
	
		if data:
			return data.get_custom_data("one_way")
			print(data)
			
		print(data)
		
func get_clicked_tile_power():
	if up_ray_cast.is_colliding():
		var collider = up_ray_cast.get_collider()
		
		var cell = collider.local_to_map(up_ray_cast.get_collision_point())
		
		var data = collider.get_cell_tile_data(cell)
		
		if data:
			return data.get_custom_data("one_way")
		else:
			return 0
