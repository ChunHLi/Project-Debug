class Boss1 extends Enemy{
  int attacksLeft, attackTimer;
  
  Boss1(){
    setHP(250000);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Masaki.png");    
    attacksLeft = 4;
    attackTimer = 1800;
  }
  
}
