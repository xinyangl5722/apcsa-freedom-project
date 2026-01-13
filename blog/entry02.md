# Entry 2
##### 12/15/2025

### Familiarizing with Tool
Over the last month, I finally was able to download GoDot. I borrowed a new Windows Laptop and got some help on downloading the GoDot Program into my windows. Once that was done, I started to learn how to familiarize myself into the program.  
I started off with learning about nodes and scenes. Here's what I have found out.
* The game is made up with different scenes which can be different
* Each scene is made up of nodes which are the smallest building blocks in a game

I also learned how to create a single character animation. I went to the [GoDot Official Website](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/02.player_scene.html) for some guidance. I started to create a player scene with Animation nodes. Inside of the node, I created the two sprite frames.
<img width="1260" height="467" alt="Screenshot-animation-page.png" src="https://github.com/xinyangl5722/apcsa-freedom-project/blob/main/tool/Screenshot-animation-page.png?raw=true">
I later started to create the animation code by making commands for each key pressed for the scene.

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
In addition, I learned more about if-statements in GoDot. So, this was the code to change sprites.
```java
if Input.is_action_pressed("click"):
		$AnimatedSprite2D.animation = "click"
	else:
		$AnimatedSprite2D.animation = "walk"
```
In addition, I also learned hwo to make a main scene and connect all other scenes together using this [GoDot Docs](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/05.the_main_game_scene.html).
<img width="286" height="198" alt="image" src="https://github.com/user-attachments/assets/d52d686b-a000-47bc-866e-7571a491f2de" />

My goal for winter break and the next steps in general is going to be learning the components to making a desktop pet such as transparent windows and making the sprite walk randomly. In addition, I am also planning to learn other components of GoDot such as dragging sprites, etc.

### EDP
I'm in the middle of **planning the prototype** as I had learned a few of the basics of my tool such as reactions when a key is pressed, and making the animations move. In addition, I learned the different layers in each GoDot game such as nodes and scenes.

### Skills
One skill I had developed was **How to learn**. In the past month, I had been learning some code by learning some tutorials from the [GoDot Docs](https://docs.godotengine.org/en/stable/index.html). Those tutorials for a few basic components really gave me more of an insight on how to learn the coding and the components in GoDot. Another skill I had developed was **Organization**. Because I am in a coding style that is completely different from what I am usually used to (like the 2D section of the actual game to place the sprites in ), I have to be very careful on organizing the code or else things can get really messy. I basically learned to name each scene as the name that is easier for me to understand, putting each scene in each parent scene, etc.

### Summary
In short, I had figured out to download the GoDot platform and also learn a few of the basic concepts of the GoDot code language and fuction, and I am planning to continue to learn more of the components in GoDot such as how to make the sprite randomly move, how to move a sprite when you click and drag it, etc. In general, my goal for winter break and the next steps in general is also going to be learning the components to making a desktop pet such as transparent windows and making the sprite walk randomly.

[Previous](entry01.md) | [Next](entry03.md)

[Home](../README.md)
