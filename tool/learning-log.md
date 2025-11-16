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
 

<!-- 
* Links you used today (websites, videos, etc)
* Things you tried, progress you made, etc
* Challenges, a-ha moments, etc
* Questions you still have
* What you're going to try next
-->
