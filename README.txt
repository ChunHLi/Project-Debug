Project-Debug
=============

APCS Final Project Term 1

Touhou-esque top-down shooter. Tentative title. 3 stages with survival mode planned; patterns will generally be 
static/pseudo-static.

12/24/14-Shawn Li- Created repository.

12/26/14-Oscar Ngan- Created variable/classlist.

1/3/15-Oscar Ngan- Created abstract class Units (defines hitboxes).

1/6/15-Shawn Li- Created the subclasses of class "Units" which includes Player, Enemy, Items, Bullets, constructors still have to be implemented and methods need to be coded.
1/6/15-Oscar Ngan- Updated constructors for Player subclass; began development of characters and shot types for characters, as well as development of bosses and boss attacks.

1/7/15-Shawn Li- Created a driver in order to test demos and a demo displaying the usage of PVectors, rect, and other commands. Requires Oscar to learn from this demo.

1/8/15-Shawn Li- Made the Player class able to move using keypress, however diagonal movement is still not working, seeking help in google groups.
1/8/15-Oscar Ngan- Made playerShot class, a subclass for Bullets.

1/9/15-Created keypressed for shooting bullets, however similar to movement, you can't simultaneously press keys. REMINDER TO ASK MR.K FOR HELP.

1/10/15 (work rolled over from 1/9/15 past midnight)-Oscar Ngan- Completed remaining constructors; created ArrayLists for other relevant classes; began development on display of other classes.

1/11/15-Shawn Li- Sprite folder has been created. Bullet sprites have been uploaded; others are still in progress. Next priority is to create a background.

1/12/15-Shawn Li/Oscar Ngan - Many accomplishments have been made including
    -Created a looping background.(Shawn Li)
    -Learned how to apply image sprites to classes from a sprite sheet.(Shawn      Li)
    -Sprites have been made. (Oscar Ngan)

1/13/15-Shawn Li - Very productive day!
    -FIXED the keypressed issue where only one key can be pressed at a time. Now diagonal movement and strafing is now possible!
    -Changed hitboxes to be circular making it much easier to detect hitbox collision (hitbox variable now replaced with radius).
    -Collisions can now be detected! PlayerBullet to Enemy Collision has now been included and Player to Enemy Collision has now been included.
    -Invulnerability when hit has now been included (Player only).

1/14/15-Shawn Li - Not as much done as I would've wanted...
    -Created EnemyShot Class.
	~ However target lockon system has still not been implemented.
        ~ Sprite still has to be picked.
    -Created Item Class.
	~ However Sprites have not been split yet.
    -Created checkBoundary methods.
	~ However ones for entire arrays have not been completed.
    -Included Variables to store index numbers.


Goals for 1/14/15:
- Create and complete the enemyShot subclass.
- Create and complete the item class.
- Create the checkBoundary methods for entire Arrays.
- Include variables to store the index numbers of elements in an array within the element. (This will be used in order to remove bullets when they hit an enemy, remove enemies when they run out of HP, etc).

Goals for 1/15/15:
- Complete any goals that weren't reached on 1/14/15.
- Create the interface which shows lives and etc.
- Create respawn method.
- Create shootBomb method.
- Create scoring system. 

Goals for 1/16/15:
- Create subclasses, (mostly enemies, player classes, 
- Attach sprites to subclasses and classes. 
- Create menu.

Goals for 1/17/15 - 1/19/15:
- Creating the stage.
- Cleaning up the code.

What needs to be done ASAP:
    -CheckBoundaryMethods for entire ArrayLists.
    -Method to remove objects when their HP has dropped to 0.
    -LockOn System for enemy bullets.