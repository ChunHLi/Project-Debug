class Boss2 extends Enemy{
  int attacksLeft, attackTimer;
  //Timer should be 3600 for all attacks. HP should be 900 for all attacks, except for the last one; that's 1080.
  
  Boss2(){
    setHP(900);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Kurumi.png");    
    attacksLeft = 6;
    attackTimer = 3600;
  }
  
  
}
