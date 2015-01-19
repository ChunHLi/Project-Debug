//Enemy of Type 0 are in wave 0
//Enemy of Type 1 are in wave 1
//etc, etc.

class Enemy extends Unit{
    int Ecounter; 
    int attacksLeft = 3; //boss variable
    int attackTimer = 2700; //boss variable
    PImage enemySprite;
    int timer, copyTimer, type, bossTimer, bossCopyTimer,bossTimer2, bossCopyTimer2;
    float sin; //boss variable
    int doesItDropItem;
    
  Enemy(){
    setHP(50);
    setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    enemySprite = loadImage("../../Sprites/Enemy/Generic/EnemySprites.png");    
    timer = 10;
    copyTimer = 10;
    type = 0;
  }
  
  Enemy(int nHP, int nRadius, int nTimer, float positionX, float positionY, float velocityX, float velocityY, int ECounter, int newType,int dropItem){
    Ecounter = ECounter;
    setHP(nHP);
    setRadius(nRadius);
    position.x = positionX;
    position.y = positionY;
    velocity.x = velocityX;
    velocity.y = velocityY;
    enemySprite = loadImage("../../Sprites/Enemy/Generic/EnemySprites.png");
    timer = nTimer;
    copyTimer = nTimer;
    type = newType;
    doesItDropItem = dropItem;
  }
  
  void move(){
    if (type == 0 || type == 4){
      if (position.y < height/5){
        position.y += velocity.y;
      }
    }
    if (type == 1){
      if (position.x < width/8){
        position.x += velocity.x;
      }
      else if (position.x > 3*width/8){
        position.x -= velocity.x; 
      }
    }
    if (type == 2){
      if ((position.x < 10) || (position.x > width/2 - 10)){
        velocity.x = velocity.x*-1;
      }
      position.x += velocity.x;
    }
    if (type == 3){
      if (position.y < height/2){
        position.y += velocity.y;
      }
    }
  }
  
  void display(){
    if (type == 0){
      image(enemySprite.get(274,141,22,22),position.x-11,position.y-11);
    }
    if (type == 1){
      image(enemySprite.get(337,139,22,26),position.x-11,position.y-13);
    }
    if (type == 2){
      image(enemySprite.get(369,172,26,22),position.x-13,position.y-11);
    }
    if (type == 3){
      image(enemySprite.get(44,230,32,32),position.x-16,position.y-16);
    }
    if (type == 4){
      image(enemySprite.get(336,235,25,25),position.x-13,position.y-13);
    }
  }
}
  
