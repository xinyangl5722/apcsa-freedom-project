# Tool Learning Log

## Tool: **GoDot**

## Project: **Desktop Pet**

---

### 10/5/2025:
* I decided to learn how to install GoDot first
* I started by watching a [YouTube tutorial](https://www.youtube.com/watch?v=8Mf60ckpgO0)
* After the video tutorial, I started to download GoDot in the official website
  * I first press the download button and extracted the file
* I started to have trouble with incorporating the downloaded file in my IDE
* Next Step: Ask Mr. Mueller or anyone else that uses GoDot how to put GoDot in my IDE

### 11/2/2025:
* I decided to ask my friend some help on how to add GoDot to the IDE and I got this [GotDot Web Editor](https://editor.godotengine.org/releases/latest/) for GoDot
* My first step is to actually familiarize myself with godot so I know what is happening.
* I first click `Node2D` to get the 2d screen
* I later learned how to insert a sprite into the screen.
  * I had some trouble at first, but I ended up asking one of my friends for help. Turns out I just need to drag the file into the screen.
<img width="1360" height="467" alt="Screenshot 2025-11-02 9 02 23 PM" src="https://github.com/user-attachments/assets/6ed1a572-742b-476f-a57b-57f54b7880c7"/>

* Next Steps: Familiarize myself with the GoDot a bit more and try to find out how to incorporate it into my IDE

### 11/16/2025:
* For this learning log, I learned how to set up the sprites on GoDot
* I first start to learn how to familiarize myself with this GoDot Application
* I looked at the tutorial in the [official GoDot](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/02.player_scene.html) for a tutorial of making a 2D game
* I learned that there are different nodes for different properties in a game
  * I created this `AnimatedSprite2D` node and inserted the animated sprites. (These are from the tutorial in the GoDot)
<img width="1260" height="467" alt="Screenshot-animation-page.png" src="https://github.com/xinyangl5722/apcsa-freedom-project/blob/main/tool/Screenshot-animation-page.png?raw=true">

* As you can see, on the bottom, there is the added animation sprites
* I later created a script for the code
* I start with declaring the member variables needed for the game to work
```java
extends Area2D
@export var speed = 400
var screen_size
```
* The `exports var speed` allows to set the speed of the sprite
* The `var screen-size` is the size of the game.
* **Next Steps: Learn how to make the animations move**

### 11/23/2025
* Today I learned how to make the sprites move.
* When I first played the game the last time, the sprite didn't move. So I didn't know what to do.
  * So I went to the [GoDot Docs](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/05.the_main_game_scene.html) and realized I need to make the main scene
* So, I first made a main scene so that the "game" has a main scene to start
<img width="286" height="198" alt="image" src="https://github.com/user-attachments/assets/d52d686b-a000-47bc-866e-7571a491f2de" />

* So I just added the scene I made the animation for into the main scene
* I later started to add code for the animation while the [GoDot Docs for Animation](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/03.coding_the_player.html) teaches me how to do it.

```java
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
```
* This is basically the code for the sprite to move. So for whatever arrow key you pressed, it will go in that direction
* In addition, the if statement below is for the sprite to keep moving and stop moving when the arrow keys are not pressed
* I later did the code to flip the sprites when they have to go to the opposite direction

```java
if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		
		$AnimatedSprite2D.flip_h = velocity.x < 0

	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
```
* This code shows that the sprite will flip depending on the values of x and y to see if it will switch to another animation movement
* Next Steps: Try figuring out some if-statements for sprites such as reacting when touched the sprite with mouse

### 12/7/2025
* Today, I learned another if-statement that changes something else instead of just movement.
* I went back to the [GoDot Docs](https://docs.godotengine.org/en/4.4/getting_started/first_2d_game/03.coding_the_player.html#choosing-animations) for this. I also looked back at the previous code and decided to take away from some fragments and put them together.
* I start on with this code.
```java
if Input.is_action_pressed("click"):
		$AnimatedSprite2D.animation = "click"
```
* This shows that it will transform into another sprite when I click the letter k.
* The only problem is that when I start the game, it appears as the other sprite.
* So, I started to add the else.
```java
if Input.is_action_pressed("click"):
		$AnimatedSprite2D.animation = "click"
	else:
		$AnimatedSprite2D.animation = "walk"
```
* Now it works, but the next problem is that the sprite don't stay as the other sprite when I click the key.
* So, I need to figure out how to keep the sprite like the other sprite when I press the k key
* Next Steps: Continue to fix on the if-statement so the sprite will stay as the other sprite for longer if I pressed k.

### 12/14/2025
* Today, I realized that I am still not familiar with GoDot's function, so I decided to try to familiarize myself with it (because everything looks so confusing)
* I started with this [GoDot overview](https://docs.godotengine.org/en/stable/getting_started/introduction/key_concepts_overview.html) with their scenes and nodes
	* In a game, there are scenes which are parts of a game. It can be a player, a random object, enemy, etc.
 	* A scene is made up with nodes (the smallest blocks arranged)
* I went back to my own code and first familiarize myself with the nodes I had already been doing for the past weeks. First was the Animation node.
<img width="1912" height="1087" alt="image" src="https://github.com/user-attachments/assets/27cf341f-f3f7-4aa9-bc18-f8981d014f32" />
* At the side bar on the top left, there is a enemy node with an Animation node that is the child of the enemy node. The animation node provides the animation needed for the enemy node.
* At the sidebar on the left, we have the sprite frames which we can include the sprites we can include for the animation
* The transform section shows the starting point of the sprite
* I also tried to learn how to rotate the sprite that I had been working on for the past weeks now that I have refreshed what the `animation2D` node does

```java
var rotation_direction = 0
func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("move_down", "move_up") * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
```

* The only problem is that some variables _"are not identified"_ so I need to work on that
* Next Steps: Continue familiarizing myself with the GoDot function thing and learn how to rotate sprites

### 1/12/2026
* I found this [YouTube tutorial](https://www.youtube.com/watch?v=9JHFrnt5j_k) on how to create a desktop pet
* I decided to learn how to create some sort of transparent background
	* I turned on advanced settings and then turned on “transparency” in the project settings display version
	* I later switched the viewport size to 150 as the default since it needs to be the size of the desktop pet
   <img width="1197" height="737" alt="image" src="https://github.com/user-attachments/assets/92f1e7f8-5a08-4bbd-a8c0-d48be60f5b8b" />
	* I then went to the rendering to turn on transparent background in viewport
	* I later went on to game and turn off the embedded gameplay thing
 		* In addition to that, I also added some nodes for the test "desktop pet"
   <img width="1910" height="866" alt="image" src="https://github.com/user-attachments/assets/dc7c2d97-3bf2-4e2d-bcbb-955a290e2cfd" />

* This was all on the project settings that we basically have to do before actually making the code
	* Transparency allowed for the game to have a transparent background
		* This is probably because the desktop pet already is the transparent background
	* Also the enabled play is probably because the desktop pet is not really a game, but it is more of a downloadable feature
* My next steps for the next learning log
	* Have a mock sprite to input into the “game” and then test it out according to the video

### 3/6/2026
* I continued setting up the transparency background
<img width="1905" height="1020" alt="image" src="https://github.com/user-attachments/assets/1e77eab5-9c4e-4daf-9279-88e3f1d85274" />
	* I started with creating the animation sprite frames and added the two sprites into the frames box below
 	* I later added a script and started writing the code according to the [video](https://www.youtube.com/watch?v=9JHFrnt5j_k&t=152s).
<img width="1626" height="1038" alt="image" src="https://github.com/user-attachments/assets/974dfb4d-9051-4f23-a8cb-7c9c84330fa7" />
  	* However, there is some sort of error, so I need to fix the code.
  	* Next steps: Learn the movement for the sprite and trying to fix the code for transparent background
 
### 3/21/2026
* I went back to the [YouTube video](https://www.youtube.com/watch?v=9JHFrnt5j_k&t=1s) to fix up the transparency background
* As I went through the video, I saw that I had to click on a button for auto play, so I clicked on auto play
  
<img width="570" height="283" alt="image" src="https://github.com/user-attachments/assets/313e063c-daa3-4e1d-a66b-73a7159c1656" />

* I later also realized that I had to align the desktop pet with the blue box on the 2D display
  
<img width="295" height="283" alt="image" src="https://github.com/user-attachments/assets/17a1f9b3-fb6e-4b70-beca-50b57c59b96d" />

* Later on, I save it as a new folder called "Scenes" and create a new script in a new folder called "scripts" folder
* Then, I started to add the following code again

```java
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
```
* And then, the code finally worked!
* I finally learned how to create the transparent background for the desktop pet successfully. My next steps are to give the desktop pet movement while also creating my mvp by looking for the design of my desktop pet






<!-- 
* Links you used today (websites, videos, etc)
* Things you tried, progress you made, etc
* Challenges, a-ha moments, etc
* Questions you still have
* What you're going to try next
-->
