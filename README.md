# PortendsGreatness

Taaseen Ali, Richard Wong, Eddie Zhu

# Swipe Brick Breaker Clone

## Overview

- The board is created and the user is given one ball and a collection of bricks is displayed on the board. 
- The user can aim the launcher and shoot the ball in the direction specified by their mouse placement.
- Bricks are visible at the top of the screen, and shift down as levels progress.
- The number of hits it takes to destroy a brick is displayed on each brick.
- Green balls are also created along with the brick giving the user the chance to collect more balls
- When the bricks hit the bottom of the screen, the game is over. 

## Description

- The board contains a set of bricks, and the bricks are placed randomly and can be adjacent to one another. 
- Balls are given to the users, and the users can aim the ball to hit bricks and break them. 
- Bricks can take multiple hits to be broken. Bricks have a counter on them that specify the number of hits they require to break, and each time a ball reaches the coordinates of the edge of a brick, the counter is decreased. 
- Balls can bounce off walls, but once one ball hits the floor in a specific point, that point will the the starting point for the next launch. 
- The movement of the balls are based off vector functions, which calculate their trajectory using pixels. 
- Bricks spawn from the top as levels progress, and the number of hits it takes to  break each brick increases with each shift of the bricks. 
- The launcher contains a linked list of balls, which dequeues a ball for it to be fired in the direction of the mouse coordinate specified by the user's mouse placement on the board. 
- Hitting a green ball powerup will give the user an additional ball to use for the next launch and subsequent launches.
- When the bottom brick's coordinates equals the coordinates of the bottom screen, the game is ended an and endgame screen is displayed. 


## Launch Instructions

- Clone the repo
- Navigate to /BrickBreaker
- Open BrickBreaker.pde
- Click play in Processing
- Have fun!

