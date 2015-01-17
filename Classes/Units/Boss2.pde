class Boss2 extends Enemy{
  int attacksLeft, attacktimer;
  
  Boss2(){
    setHP(250000);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Kurumi.png");    
    attacksLeft = 6;
    attackTimer = 1800;
  }
  
  
}
