class Boss1 extends Enemy{
  int attacksLeft, attackTimer,timer,copyTimer;
  //timer values should be 2700; HP should be 720 at the beginning of each new attack.
  
  Boss1(){
    setHP(720);
    //setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    //enemySprite = loadImage("../../Sprites/Enemy/Boss/Masaki.png");    
    attacksLeft = 4;
    attackTimer = 2700;
    velocity.x = 4;
    velocity.y = 0;
    timer = 0;
    copyTimer = 600;
  }
  
  void move(){
    if (position.x + 20 > width/2){
      position.x -= velocity.x;
    }
    else if (position.x - 20 < 0){
      position.x += velocity.x;
    }    
    else{
      if (random(2) == 0){
        position.x += velocity.x;
      }
      else{
        position.x -= velocity.x;
      }
    }
  }
  
  void bossAttack(){
    if (attacksLeft == 4){
      attack();
    }
    if (attacksLeft == 3){
    }
    if (attacksLeft == 2){
    }
    if (attacksLeft == 1){
    }
    if (attacksLeft == 0){
    }
    nextPart();
  }
  
  void nextPart(){
    if ((HP <= 0) || (attackTimer <= 0)){
      if (attacksLeft > 0){
        attacksLeft = attacksLeft - 1;
        setHP(720);
        attackTimer = 2700;
      }
      else{
        enemyList.remove(0);
      }
    }
    attackTimer -= 1;
  }
  
  void attack(){
    if (timer <= 0){
      int counter = 0;
      float angle = 0;
      while (counter < 36){
        addEShot(new enemyShot(position.x,position.y,cos(angle),sin(angle),ESCounter,playerList,1));
        counter += 1;
        angle += 10;
        timer = copyTimer;
      }
      counter = 0;
      float acceleration = 0.01;
      float velocityX = 0.01;
      float velocityY = 2;
      while (counter < 20){
        addEShot(new enemyShot(21,height/4,velocityX,velocityY,ESCounter,2));
        counter += 1;
        velocityX += acceleration;
        velocityY += acceleration/2;
      }
    }
    else{
      timer -= 1;
    }
  }
  void specialAttack(){
  }
  void attack2(){
  }
  void specialAttack2(){
  }
}
