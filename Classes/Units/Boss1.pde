class Boss1 extends Enemy{
  int attacksLeft, attackTimer;
  //All timer values should be 2700; HP should be 720 at the beginning of each new attack.
  
  Boss1(){
    setHP(720);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Masaki.png");    
    attacksLeft = 4;
    attackTimer = 2700;
  }
  
}
