class Boss3 extends Enemy{
  int attacksLeft, attackTimer;
  //Assuming we get here... HP values are as follows: 400, 800, 400, 800, 400, 1000, 880, 1000, 1200.
  //Timers are 4200 until spell 3; then 5400, 5940 and 7200.
  
  Boss3(){
    setHP(400);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Mugino.png");    
    attacksLeft = 9;
    attackTimer = 4200;
  }
  
  
}
