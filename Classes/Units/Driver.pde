ArrayList<Player> playerList = new ArrayList<Player>(0);
ArrayList<playerShot> pShotList = new ArrayList<playerShot>(0);
ArrayList<Enemy> enemyList = new ArrayList<Enemy>(0);
ArrayList<enemyShot> eShotList = new ArrayList<enemyShot>(0);
ArrayList<Items> itemList = new ArrayList<Items>(0);
int ECounter;
int ICounter;
int PSCounter;
int ESCounter;
PImage a;
float x;
float y = 1;
boolean[] keys;
int timer = 0;


void setup(){
  frameRate(60);
  size(480,720);
  playerList.add(new Player());
  enemyList.add(new Enemy(50, 20, 10, width/2, height/6, 0));
  a = loadImage("../../Background/Background4.jpg");
}
void draw(){
  loopBackground();
  playerList.get(0).move();
  playerList.get(0).display();
  enemyList.get(0).move();
  displayEnemy();
  playerBullets();
  enemyAttack();
  checkPlayerEnemyCollision();
  println("Player's HP: " + playerList.get(0).HP);
  println("Enemy's HP: " + enemyList.get(0).HP);
  println(eShotList.size());
}

void keyPressed(){
    //if (key == 'x'){
    //  playerShot newPShot = new playerShot(playerList.get(0).position.x - playerList.get(0).velocity.x, playerList.get(0).position.y - playerList.get(0).velocity.y*3,playerList.get(0).velocity.y);
    //  pShotList.add(newPShot);
    //  counter = 0;
    //}
  
  if (key == CODED){
    if (keyCode == UP){
      keys[0] = true;
    }
    if (keyCode == DOWN){
      keys[1] = true;
    }  
    if (keyCode == LEFT){
      keys[2] = true;
    }
    if (keyCode == RIGHT){
      keys[3] = true;
    }
  }
  if (key == 'c'){
    keys[5] = true;
  }
  if (key == 'z'){
    keys[4] = true;
  }
}

void keyReleased(){
  if (key == CODED){
      if (keyCode == UP){
        keys[0] = false;
      }
      if (keyCode == DOWN){
        keys[1] = false;
      }
      if (keyCode == LEFT){
        keys[2] = false;
      }
      if (keyCode == RIGHT){
        keys[3] = false;
      }
  }
  if (key == 'c'){
    keys[5] = false;
  }
  if (key == 'z'){
    keys[4] = false;
  }
}

void playerBullets(){
  playerShoot();
  checkBulletEnemyCollision();
  movePshots();
  displayPShot();
}

void enemyAttack(){
  int counter = 0;
  while (counter < enemyList.size()){
    shootBullet(enemyList.get(counter));
    counter += 1;
  }
  checkBulletPlayerCollision();
  moveEshots();
  displayEShots();
}
void playerShoot(){
  if (keys[4] && 40 - timer <= playerList.get(0).power){
    pShotList.add(new playerShot(playerList.get(0).position.x, playerList.get(0).position.y,10,PSCounter));
    timer = 0;
  }
  if (timer < 40){
    timer += 1;
  }
}

void deployBomb(){
}

void moveEshots(){
  int counter = 0;
  while (counter < eShotList.size()){
    eShotList.get(counter).moveBullet();
    counter += 1;
  }
}

void movePshots(){
  int counter = 0;
  while (counter < pShotList.size()){
    pShotList.get(counter).moveBullet();
    counter += 1;
  }
}

void displayPShot(){
  int counter = 0;
  while (counter < pShotList.size()){
    pShotList.get(counter).display();
    counter += 1;
  }
}

void shootBullet(Enemy TheEnemy){
  if (TheEnemy.timer <= 0){
    eShotList.add(new enemyShot(TheEnemy.position.x,TheEnemy.position.y,5,ESCounter, playerList));
    TheEnemy.timer = TheEnemy.copyTimer;
  }
  else{
    TheEnemy.timer -= 1;
  }
}

void displayEShots(){
  int counter = 0;
  while (counter < eShotList.size()){
    eShotList.get(counter).display();
    counter += 1;
  }
}
void displayEnemy(){
  int ECounter = 0;
  while (ECounter < enemyList.size()){
    enemyList.get(ECounter).display();
    ECounter += 1;
  }
}

void displayItem(){
  int ICounter = 0;
  while (ICounter < itemList.size()){
    itemList.get(ICounter).display();
    ICounter += 1;
  }
}

 void checkBulletEnemyCollision(){
   int counter = 0;
   while (counter < enemyList.size()){
     int counter2 = 0;
     while (counter2 < pShotList.size()){
       pShotList.get(counter2).checkBoundaryCollision(enemyList.get(counter),pShotList);
       counter2 += 1;
     }
     counter += 1;
   }
 }

void checkPlayerEnemyCollision(){
  int counter = 0;
  while (counter < playerList.size()){
    int counter2 = 0;
    while (counter2 < enemyList.size()){
      playerList.get(counter).checkBoundaryCollision(enemyList.get(counter2));
      counter2 += 1;
    }
    counter += 1;
  }
}

void checkBulletPlayerCollision(){
   int counter = 0;
   while (counter < playerList.size()){
     int counter2 = 0;
     while (counter2 < eShotList.size()){
       eShotList.get(counter2).checkBoundaryCollision(playerList.get(counter),eShotList);
       counter2 += 1;
     }
     counter += 1;
   }
}

void loopBackground(){
  image(a,0,int(y)); //scrollt bg naar beneden
  if(y > height){
    x = width/2;
    y = 0;
  }
  image(a.get(0,a.height-int(y),a.width,a.height),0,0);
  y += 2;
}


