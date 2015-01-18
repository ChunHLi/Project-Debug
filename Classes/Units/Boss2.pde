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
    if (attacksLeft == 6){
    }
    if (attacksLeft == 5){
    }
    if (attacksLeft == 4){
    }
    if (attacksLeft == 3){
    }
    if (attacksLeft == 2){
    }
    if (attacksLeft == 1){
    }
    if (attacksLeft == 0){
    }
  }
  void nextPart(){
    if ((HP <= 0) || (attackTimer <= 0)){
      if (attacksLeft > 0){
        attacksLeft = attacksLeft - 1;
      }
    }
  }
  void attack(){
  }
  void specialAttack(){
  }
  void attack2(){
  }
  void specialAttack2(){
  }
  void attack3(){
  }
  void specialAttack3(){
  }
}
