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

<!-- 
* Links you used today (websites, videos, etc)
* Things you tried, progress you made, etc
* Challenges, a-ha moments, etc
* Questions you still have
* What you're going to try next
-->
