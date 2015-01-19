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
boolean wave1start = true;
boolean wave2start = false;
boolean wave3start = false;
boolean wave4start = false;
boolean wave5start = false;
boolean bossStart = false;
boolean bossBattle = false;
int waveCounter = 0;
float Type1Angle = 0;



void setup(){
  frameRate(60);
  size(960,720);
  playerList.add(new Player());
  //addEnemy(new Enemy(50, 20, 10, width/8, height/6, 3, 1.5, ECounter,0));
  //addEnemy(new Enemy(50, 20, 10, width/8, height/6, 5, 2.5, ECounter,1));
  //addEnemy(new Enemy(50, 20, 20, 3*width/8, height/6, 3, 1.5, ECounter,2));
  //addEnemy(new Boss1());
  //enemyList.get(0).move();
  addItem(new Items(width/4,height/3,20,.1,1,0,3));
  a = loadImage("../../Background/Background4.jpg");
}
void draw(){
  if (InterfaceUpdateTimer > 0){
    InterfaceUpdateTimer -= 1;
  }
  else{
    background(0);
    Interface();
    InterfaceUpdateTimer = 0;
  }
  loopBackground();
  playerMove();
  enemyMove();
  itemMove();
  if (itemList.size() > 0){
    itemList.get(0).drop();
  }
  playerBullets();
  enemyAttack();
  checkPlayerEnemyCollision();
  if (playerList.size() > 0){
    if (eShotList.size() == 0){
      playerList.get(0).invulnTime = 0;
    }
  }
  if (wave1start == true){
    addEnemy(new Enemy(50, 20, 10, width/12, height/360, 0, 1.5, ECounter,0,2));
    addEnemy(new Enemy(50, 20, 10, width/6, height/360,0,1.5,ECounter,0,0));
    addEnemy(new Enemy(50, 20, 10, width/4, height/360,0,1.5,ECounter,0,2));
    addEnemy(new Enemy(50, 20, 10, width/3, height/360,0,1.5,ECounter,0,0));
    addEnemy(new Enemy(50, 20, 10, 5*width/12, height/360,0,1.5,ECounter,0,2));
    wave1start = false;
  }
  if (enemyList.size() == 0 && waveCounter == 0){
    wave2start = true;
    waveCounter += 1;
  }
  if (wave2start == true){
    addEnemy(new Enemy(100, 20, 2, 0, height/3, 1.5, 0, ECounter,1,0));
    addEnemy(new Enemy(100, 20, 2, width/2 - 10, height/3, 1.5, 0, ECounter,1,0));
    wave2start = false;
  }
  if (enemyList.size() == 0 && waveCounter == 1){
    wave3start = true;
    waveCounter += 1;
  }
  if (wave3start == true){
    addEnemy(new Enemy(30, 20, 30, 10, height/12, 1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, width/2 - 10, height/12 + 30, -1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, 10, height/12 + 60, 1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, width/2 - 10, height/12 + 90, -1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, 10, height/12 + 120, 1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, width/2 - 10, height/12 + 150, -1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, 10, height/12 + 180, 1.5, 0, ECounter,2,0));
    addEnemy(new Enemy(30, 20, 30, width/2 - 10, height/12 + 210, -1.5, 0, ECounter,2,0)); 
    wave3start = false;
  }
  if (enemyList.size() == 0 && waveCounter == 2){
    wave4start = true;
    waveCounter += 1;
  }
  if (wave4start == true){
    addEnemy(new Enemy(1000,20,0, width/4, height/12, 0, 1.5, ECounter,3,4));
    wave4start = false;
  }
  if (enemyList.size() == 0 && waveCounter == 3){
   wave5start = true;
   waveCounter += 1;
  }
  if (wave5start == true){
    addEnemy(new Enemy(100, 20, 10, width/12, height/360, 0, 1.5, ECounter,0,2));
    addEnemy(new Enemy(100, 20, 10, width/6, height/360,0,1.5,ECounter,0,0));
    addEnemy(new Enemy(500, 40, 100, width/4, height/360,0,1.5,ECounter,4,4));
    addEnemy(new Enemy(100, 20, 10, width/3, height/360,0,1.5,ECounter,0,0));
    addEnemy(new Enemy(100, 20, 10, 5*width/12, height/360,0,1.5,ECounter,0,2));
    wave5start = false;
  }
  if (enemyList.size() == 0 && waveCounter == 4){
    bossStart = true;
    waveCounter += 1;
  }
  if (bossStart == true){
    addEnemy(new Boss1());
    bossStart = false;
    bossBattle = true;
  }
  if (bossBattle == true){
    boss1Attack();
  }
}
  

void keyPressed(){
  
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
  if (key == 'z'){
    keys[5] = true;
  }
  if (key == 'x'){
    keys[4] = true;
  }
  if (key == 'c'){
    keys[6] = true;
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
  if (key == 'z'){
    keys[5] = false;
  }
  if (key == 'x'){
    keys[4] = false;
  }
  if (key == 'c'){
    keys[6] = false;
  }
}

void Interface(){
  textSize(32);
  if (playerList.size() > 0){
    text("Score: " + pseudoScore + playerList.get(0).Score, width/2 + 10, 32);
    fill(255);
    text("Lives: " + playerList.get(0).HP, width/2 + 10, 60);
    fill(255);
    text("Power: " + playerList.get(0).power, width/2 + 10, 88);
    fill(255);
    text("Bombs: " + playerList.get(0).Bombs, width/2 + 10, 116);
    fill(255);
    text("Life Pieces: " + playerList.get(0).LCount, width/2 + 10, 144);
    fill(255);
    text("Bomb Pieces: " + playerList.get(0).BCount, width/2 + 10, 172);
    fill(255);
  }
  else{
    text("Score: " + pseudoScore, width/2 + 10, 30);
    fill(255);
    text("Lives: " + 0, width/2 + 10, 64);
    text("Power: " + 0, width/2 + 10, 88);
    fill(255);
    text("Bombs: " + 0, width/2 + 10, 116);
    fill(255);
    text("Life Pieces: " + 0, width/2 + 10, 144);
    fill(255);
    text("Bomb Pieces: " + 0, width/2 + 10, 172);
    fill(255);
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
      itemList.get(counter).drop();
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
  if (keys[4]){
    if (playerList.get(0).power > 80){
      if ((25 - timer) <= 80 - 60){
        addPShot(new playerShot(playerList.get(0).position.x - 15, playerList.get(0).position.y,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x - 5, playerList.get(0).position.y - 10,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x + 5, playerList.get(0).position.y - 10,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x + 15, playerList.get(0).position.y,10,PSCounter));
        timer = 0;
      }
    }
    else if (playerList.get(0).power > 60){
      if ((25 - timer) <= playerList.get(0).power - 60){
        addPShot(new playerShot(playerList.get(0).position.x - 15, playerList.get(0).position.y,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x - 5, playerList.get(0).position.y - 10,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x + 5, playerList.get(0).position.y - 10,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x + 15, playerList.get(0).position.y,10,PSCounter));
        timer = 0;
      }
    }
    else if (playerList.get(0).power > 40){
      if ((25 - timer) <= playerList.get(0).power - 40){
        addPShot(new playerShot(playerList.get(0).position.x - 10, playerList.get(0).position.y,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x, playerList.get(0).position.y - 10,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x + 10, playerList.get(0).position.y,10,PSCounter));
        timer = 0;
      }
    }
    else if (playerList.get(0).power > 20){
      if ((25 - timer) <= playerList.get(0).power - 20){
        addPShot(new playerShot(playerList.get(0).position.x - 5, playerList.get(0).position.y,10,PSCounter));
        addPShot(new playerShot(playerList.get(0).position.x + 5, playerList.get(0).position.y,10,PSCounter));
        timer = 0;
      }
    }
    else if (playerList.get(0).power >= 0){
      if ((25 - timer) <= playerList.get(0).power){
        addPShot(new playerShot(playerList.get(0).position.x, playerList.get(0).position.y,10,PSCounter));
        timer = 0;
      }
    }
  }
  if (timer < 25){
    timer += 1;
  }
  if (keys[6] && timer >= 25 && playerList.get(0).Bombs > 0){
    int counter = 0;
    while (counter < enemyList.size()){
      enemyList.get(counter).HP -= 480;
      counter += 1;
      playerList.get(0).Score += 1000;
    }
    while (eShotList.size() > 0){
      removeEShot(0);
      playerList.get(0).Score += 100;
    }
    timer = 0;
    playerList.get(0).Bombs -= 1;
    background(255);
  }
}

void deployBomb(){
}

void moveEshots(){
  int counter = 0;
  while (counter < eShotList.size()){
    eShotList.get(counter).rotateCounter += 1;
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
  if (TheEnemy.type == 0){
    if (TheEnemy.timer <= 0){
      addEShot(new enemyShot(TheEnemy.position.x,TheEnemy.position.y,5,0,ESCounter, playerList,0,0));
      TheEnemy.timer = TheEnemy.copyTimer;
    }
    else{
      TheEnemy.timer -= 1;
    }
  }
  if (TheEnemy.type == 1){
    if (TheEnemy.timer <= 0){
        addEShot(new enemyShot(TheEnemy.position.x,TheEnemy.position.y,cos(Type1Angle),sin(Type1Angle),ESCounter,playerList,1,1));
        Type1Angle += 10;
        TheEnemy.timer = TheEnemy.copyTimer;
      }
    else{
      TheEnemy.timer -= 1;
    }
  }
  if (TheEnemy.type == 2){
    if (TheEnemy.timer <= 0){
      addEShot(new enemyShot(TheEnemy.position.x - 20,TheEnemy.position.y + 5,2,0,ESCounter,playerList,2,2));
      addEShot(new enemyShot(TheEnemy.position.x + 20,TheEnemy.position.y + 5,2,0,ESCounter,playerList,2,2));
      TheEnemy.timer = TheEnemy.copyTimer;
    }
    else{
      TheEnemy.timer -= 1;
    }
  }
  if (TheEnemy.type == 3){
    if (TheEnemy.timer <= 0){
      addEShot(new enemyShot(TheEnemy.position.x,TheEnemy.position.y,cos(Type1Angle),sin(Type1Angle),ESCounter,playerList,1,3));
      Type1Angle += .1;
      TheEnemy.timer = TheEnemy.copyTimer;
    }
  }
  if (TheEnemy.type == 4){
    if (TheEnemy.timer <= 0){
      addEShot(new enemyShot(TheEnemy.position.x,TheEnemy.position.y, 10.0, ESCounter, 7));
      TheEnemy.timer = TheEnemy.copyTimer;
    }
    else{
      TheEnemy.timer -= 1;
    }
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
         if (enemyList.get(counter).doesItDropItem == 0){
           addItem(new Items(enemyList.get(counter).position.x,enemyList.get(counter).position.y,50,.1,0,ICounter,3));
         }
         if (enemyList.get(counter).doesItDropItem == 1){
           addItem(new Items(enemyList.get(counter).position.x,enemyList.get(counter).position.y,50,.1,1,ICounter,3));
         }
         if (enemyList.get(counter).doesItDropItem == 2){
           addItem(new Items(enemyList.get(counter).position.x,enemyList.get(counter).position.y,50,.1,2,ICounter,3));
         }
         if (enemyList.get(counter).doesItDropItem == 4){
           addItem(new Items(enemyList.get(counter).position.x,enemyList.get(counter).position.y,50,.1,3,ICounter,3));
         }
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

void boss1Attack(){
  if (enemyList.get(0).attacksLeft == 3){
      boss1Attack1();
    }
    if (enemyList.get(0).attacksLeft == 2){
      boss1SpecialAttack1();
    }
    if (enemyList.get(0).attacksLeft == 1){
      boss1SpecialAttack2();
    }
    nextPart();
  }
  
void nextPart(){
    if ((enemyList.get(0).HP <= 11) || (enemyList.get(0).attackTimer <= 0)){
      if (enemyList.get(0).attacksLeft > 0){
        enemyList.get(0).attacksLeft -= 1;
        enemyList.get(0).setHP(720);
        enemyList.get(0).attackTimer = 2700;
        addItem(new Items(playerList.get(0).position.x - 100,playerList.get(0).position.y, 100, .1, 0, ICounter, 3));
        addItem(new Items(playerList.get(0).position.x - 50,playerList.get(0).position.y, 100, .1, 2, ICounter, 3));
        addItem(new Items(playerList.get(0).position.x,playerList.get(0).position.y, 100, .1, 0, ICounter, 3));
        addItem(new Items(playerList.get(0).position.x + 50,playerList.get(0).position.y, 100, .1, 2, ICounter, 3));
        addItem(new Items(playerList.get(0).position.x + 100,playerList.get(0).position.y, 100, .1, 0, ICounter, 3));
      }
      if (enemyList.get(0).attacksLeft == 0){
        enemyList.remove(0);
      }
    }
    else{
      enemyList.get(0).attackTimer -= 1;
    }
  }
  
void boss1Attack1(){
    if (enemyList.get(0).bossTimer <= 0){
      int counter = 0;
      float angle = 0;
      while (counter < 240){
        addEShot(new enemyShot(enemyList.get(0).position.x,enemyList.get(0).position.y,cos(angle)*4,sin(angle)*4,ESCounter,2));
        counter += 1;
        angle += 1.99;
        enemyList.get(0).bossTimer = enemyList.get(0).bossCopyTimer;
      }
      counter = 0;
      float accelerationX = 0.1;
      float accelerationY = 0.01;
      float velocityX = 3.0;
      float velocityY = 4.0;
      while (counter < 24){
        addEShot(new enemyShot(10,height/10,velocityX,velocityY,ESCounter,1));
        counter += 1;
        velocityX -= accelerationX;
        velocityY -= accelerationY*counter;
      }
      counter = 0;
      accelerationX = 0.1;
      accelerationY = 0.01;
      velocityX = 3.0;
      velocityY = 4.0;
      while (counter < 24){
        addEShot(new enemyShot(width/2 - 10,height/10,-1*velocityX,velocityY,ESCounter,1));
        counter += 1;
        velocityX -= accelerationX;
        velocityY -= accelerationY*counter;
      }
    }
    else{
      enemyList.get(0).bossTimer -= 1;
    }
  }
  void boss1SpecialAttack1(){
    float positionChange = 0 + cos(enemyList.get(0).sin)*60;
    addEShot(new enemyShot(80 + positionChange, height/20, 0, 5, ESCounter, 3));
    enemyList.get(0).sin += 330;
    addEShot(new enemyShot(width/2 - 80 + positionChange, height/20, 0, 5, ESCounter, 3));
    enemyList.get(0).sin += 330;
    if (enemyList.get(0).bossTimer <= 0){
      int counter = 0;
      while (counter < 15){
        addEShot(new enemyShot(50 + counter*26,50 + counter*10,0,0.5,ESCounter,6));
        addEShot(new enemyShot(width/2 - 49 - counter*26,50 + counter*10,0,0.5,ESCounter,6));
        counter += 1;
      }
      addEShot(new enemyShot(50,50,20,10,ESCounter,4));
      addEShot(new enemyShot(width/2 - 50,50,-20,10,ESCounter,5));
      enemyList.get(0).bossTimer = enemyList.get(0).bossCopyTimer;
    }
    else{
      enemyList.get(0).bossTimer -= 1;       
    }
  }
  void boss1SpecialAttack2(){
    if (enemyList.get(0).bossTimer <= 0){
      addEShot(new enemyShot(enemyList.get(0).position.x,enemyList.get(0).position.y, 10.0, ESCounter, 7));
      enemyList.get(0).bossTimer = enemyList.get(0).bossCopyTimer;
    }
    else{
      enemyList.get(0).bossTimer -= 1;
    }
    addEShot(new enemyShot(enemyList.get(0).position.x,enemyList.get(0).position.y, 8.0, ESCounter, 3));
  }
