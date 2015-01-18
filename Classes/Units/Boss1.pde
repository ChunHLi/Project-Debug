class Boss1 extends Enemy{
  int attacksLeft, attackTimer;
  //timer values should be 2700; HP should be 720 at the beginning of each new attack.
  
  Boss1(){
    setHP(731);
    //setRadius(10);
    position.x = width/4;
    position.y = height/5;
    enemySprite = loadImage("../../Sprites/Enemy/Boss/Masaki.png");    
    attacksLeft = 4;
    attackTimer = 2700;
    velocity.x = 10;
    velocity.y = 0;
    bossTimer = 0;
    bossCopyTimer = 60;
    type = 3;
    radius = 20;
  }
  
  void move(){
    if (position.x + 20 > width/2){
      position.x -= velocity.x;
    }
    if (position.x - 20 < 0){
      position.x += velocity.x;
    }    
    else{
      if (int(random(100)) == 0){
        position.x += velocity.x;
      }
      else if (int(random(100)) == 1){
        position.x -= velocity.x;
      }
    }
  }
  
  void display(){
    image(enemySprite,position.x-40,position.y-40);
  }
}
