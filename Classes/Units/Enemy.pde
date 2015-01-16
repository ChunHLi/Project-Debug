class Enemy extends Unit{
    int counter;
    PImage enemySprite;
    int timer;
    int copyTimer;
    
  Enemy(){
    setHP(50);
    setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    enemySprite = loadImage("../../Sprites/Enemy/Generic/EnemySprites.png");    
    timer = 10;
    copyTimer = 10;
  }
  
  Enemy(int nHP, int nRadius, int nTimer, float positionX, float positionY, int ECounter){
    counter = ECounter;
    setHP(50);
    setRadius(10);
    position.x = positionX;
    position.y = positionY;
    enemySprite = loadImage("../../Sprites/Enemy/Generic/EnemySprites.png");
    timer = nTimer;
    copyTimer = nTimer;
  }
  
  void display(){
    image(enemySprite.get(15,10,30,30),position.x-15,position.y-15);
  }
}
  
