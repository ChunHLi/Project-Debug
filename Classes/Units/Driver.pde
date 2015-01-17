ArrayList<Player> playerList = new ArrayList<Player>(0);
ArrayList<playerShot> pShotList = new ArrayList<playerShot>(0);
ArrayList<Enemy> enemyList = new ArrayList<Enemy>(0);
ArrayList<enemyShot> eShotList = new ArrayList<enemyShot>(0);
ArrayList<Items> itemList = new ArrayList<Items>(0);
int ECounter;
int ICounter;
int PSCounter;
int ESCounter;
int pseudoScore;
PImage a;
float x;
float y = 1;
boolean[] keys;
int timer = 0;
int InterfaceUpdateTimer = 59;


void setup(){
  frameRate(60);
  size(960,720);
  playerList.add(new Player());
  addEnemy(new Enemy(50, 20, 10, width/8, height/6, ECounter));
  addEnemy(new Enemy(50, 20, 10, 3*width/8, height/6, ECounter));
  addItem(new Items());
  a = loadImage("../../Background/Background4.jpg");
}
void draw(){
  if (InterfaceUpdateTimer > 0){
    InterfaceUpdateTimer -= 1;
  }
  else{
    background(0);
    Interface();
    InterfaceUpdateTimer = 59;
  }
  loopBackground();
  playerMove();
  enemyMove();
  itemMove();
  playerBullets();
  enemyAttack();
  checkPlayerEnemyCollision();
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

void Interface(){
  textSize(32);
  if (playerList.size() > 0){
    text("Score: " + pseudoScore + playerList.get(0).Score, width/2 + 10, 32);
    fill(255);
    text("HP: " + playerList.get(0).HP, width/2 + 10, 60);
    fill(255);
  }
  else{
    text("Score: " + pseudoScore, width/2 + 10, 30);
    fill(255);
    text("HP: " + 0, width/2 + 10, 64);
  }
}

void playerMove(){
  if (playerList.size() > 0){
    playerList.get(0).move();
    playerList.get(0).display();
  }
}

void playerBullets(){
  if (playerList.size() > 0){
    playerShoot();
    checkBulletEnemyCollision();
    movePshots();
    displayPShot();
  }
}

void enemyMove(){
  int counter = 0;
  if (enemyList.size() > 0){
    while (counter < enemyList.size()){
      enemyList.get(counter).move();
      counter += 1;
      displayEnemy();
    }
  }
}

void itemMove(){
  int counter = 0;
  if (itemList.size() > 0){
    while (counter < itemList.size()){
      itemList.get(counter).display();
      counter += 1;
    }
  }
  checkItemPlayerCollision();  
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
    addPShot(new playerShot(playerList.get(0).position.x, playerList.get(0).position.y,10,PSCounter));
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
    addEShot(new enemyShot(TheEnemy.position.x,TheEnemy.position.y,5,ESCounter, playerList));
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
       if (enemyList.get(counter).HP <= 0){
         removeEnemy(enemyList.get(counter).Ecounter);
         break;
       }
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
       if (playerList.get(counter).HP <= 0){
         playerList.remove(0);
         break;
       }
     }
     counter += 1;
     
   }
}

void checkItemPlayerCollision(){
   int counter = 0;
   while (counter < playerList.size()){
     int counter2 = 0;
     while (counter2 < itemList.size()){
       itemList.get(counter2).checkBoundaryCollision(playerList.get(counter));
       counter2 += 1;
       if (playerList.get(counter).HP <= 0){
         playerList.remove(0);
         break;
       }
     }
     counter += 1;
   }
}

void addEnemy(Enemy TheEnemy){
  enemyList.add(TheEnemy);
  ECounter += 1;
}

void removeEnemy(int ecounter){
  int Counter = ecounter + 1;
  while (Counter < enemyList.size()){
    enemyList.get(Counter).Ecounter -= 1;
    Counter += 1;
  }
  enemyList.remove(ecounter);
  ECounter -= 1;
}

void addItem(Items TheItem){
  itemList.add(TheItem);
  ICounter += 1;
}

void removeItem(int icounter){
  int Counter = icounter + 1;
  while (Counter < itemList.size()){
    itemList.get(Counter).iCounter -= 1;
    Counter += 1;
  }
  itemList.remove(icounter);
  ICounter -= 1;
}

void addPShot(playerShot ThePlayerShot){
  pShotList.add(ThePlayerShot);
  PSCounter += 1;
}

void removePShot(int pscounter){
  int Counter = pscounter + 1;
  while (Counter < pShotList.size()){
    pShotList.get(Counter).pShotCounter -= 1;
    Counter += 1;
  }
  pShotList.remove(pscounter);
  PSCounter -= 1;
}

void addEShot(enemyShot TheEnemyShot){
  eShotList.add(TheEnemyShot);
  ESCounter += 1;
}

void removeEShot(int escounter){
  int Counter = escounter + 1;
  while (Counter < eShotList.size()){
    eShotList.get(Counter).eShotCounter -= 1;
    Counter += 1;
  }
  eShotList.remove(escounter);
  ESCounter -= 1; 
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
