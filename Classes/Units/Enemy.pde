class Enemy extends Unit{
    int counter;
    PImage enemySprite;
  Enemy(){
    setHP(50);
    setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
    enemySprite = loadImage("../../Sprites/Enemy/Generic/EnemySprites.png");    
  }
  
  Enemy(int nHP, int nRadius, float positionX, float positionY, int ECounter){
    counter = ECounter;
    setHP(50);
    setRadius(10);
    position.x = positionX;
    position.y = positionY;
    enemySprite = loadImage("../../Sprites/Enemy/Generic/EnemySprites.png");
  }
  
  void display(){
    image(enemySprite.get(15,10,30,30),position.x-15,position.y-15);
  }
}
  
