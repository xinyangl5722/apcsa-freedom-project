extends Node2D

var move_speed = 4
var direction = Vector2(1,0)
var is_chilling = false

func _input(event):
	# check fro left pause button press
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if not is_chilling:
			start_chilling()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Get acces to actual operating window
	var window = get_window()
	
	# Set transparency
	# enable transparency for both viewport and operating system
	get_viewport().transparent_bg = true
	window.transparent = true
	
	# Window shape
	# remove borders so character is floating
	window.borderless = true
	
	# keep sprite above everything
	window.always_on_top = true
	
	# Force windows to relax & let borderless
	window.unresizable = false
	
	# find the floor
	# get safe ares (minus taskbar)
	var usable_rect = DisplayServer.screen_get_usable_rect()
	
	# calculate floor position
	# end.y is part of coordinate where taskbar starts
	# Subtract window height so robot go on line
	var target_y = usable_rect.end.y - window.size.y
	
	# 3. Snap sprite
	#Snap sprite there
	window.position = Vector2i(0, target_y)
	
	# Run once at start
	_update_mouse_mask()
	
	# connect signal: update mask every time animation frame changes
	#$AnimatedSprite2D.frame_changed.connect(_update_mouse_mask)
	
	$AnimatedSprite2D.play("roll")
	
	
func _process(_delta):
	# red light:
	# If yes chilling, hit return and stop reading code
	# Moement logic below not happen
	if is_chilling: return 
	
	var window = get_window()
	
	# Vector2 vc Vector2i
	# Monitor is grid of pixles and cannot be at 10.5
	# Can use Vector2i to tell window to move exam coordinate
	var move_vector = Vector2i(direction * move_speed)
	
	# Apply to window
	window.position += move_vector
	
	# Safe zone
	# returns area without taskbar
	var usable_rect = DisplayServer.screen_get_usable_rect()
	
	# Check Right Edge
	# If right of window > right side of screen
	if window.position.x + window.size.x > usable_rect.end.x:
			direction.x = -1
			$AnimatedSprite2D.flip_h = true
	
	# check Left edge
	# If left side of window
	elif window.position.x < usable_rect.position.x:
			direction.x = 1
			$AnimatedSprite2D.flip_h = false
			
func _update_mouse_mask():
	var anim = $AnimatedSprite2D
	# 1. Get image of current data
	var texture = anim.sprite_frames.get_frame_texture(anim.animation, anim.frame)
	var image = texture.get_image()
	
	# If sprite flipped, raw image data isn't flipped
	# Have to manually flip it
	if anim.flip_h:
		image.flip_x()
		
		# 2. Create bitmap(map of solid pixels
		var bitmap = BitMap.new()
		bitmap.create_from_image_alpha(image)
		
		# 3. Create polygon (the shape)
		# 0.1 means ignore fully transaprent pixels
		var polygons = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, texture.get_size()), 0.1)
		
		# 4. Apply it to the os window
		DisplayServer.window_set_mouse_passthrough(polygons)
		

func start_chilling():
	is_chilling = true
	$AnimatedSprite2D.play("idle")
	
	# We could add a time node connect signals, etc.
	# or can use 'await'. It creates time waits, then destroys
	await get_tree().create_timer(3.0).timeout
	
	# times up
	is_chilling = false
	$AnimatedSprite2D.play("roll")
