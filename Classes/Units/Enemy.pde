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
    setHP(50);
    setRadius(10);
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
    if (type == 0){
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
  }
  
  //void display(){
  //  image(enemySprite.get(15,10,30,30),position.x-15,position.y-15);
  //}
}
  
