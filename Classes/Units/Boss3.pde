class Boss3 extends Enemy{
  int attacksLeft, attackTimer;
  
  Boss3(){
    setHP(250000);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Mugino.png");    
    attacksLeft = 8;
    attackTimer = 1800;
  }
  
  
}
