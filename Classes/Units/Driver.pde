ArrayList<Player> playerList = new ArrayList<Player>(0);
ArrayList<playerShot> pShotList = new ArrayList<playerShot>(0);
ArrayList<Enemy> enemyList = new ArrayList<Enemy>(0);
ArrayList<enemyShot> eShotList = new ArrayList<enemyShot>(0);
ArrayList<Items> itemList = new ArrayList<Items>(0);
int ECounter = 0;
int ICounter = 0;
int ESCounter = 0;
int PSCounter = 0;
PImage a;
float x;
float y = 1;
boolean[] keys;
int timer = 0;


void setup(){
  frameRate(60);
  size(480,720);
  playerList.add(new Player());
  enemyList.add(new Enemy(50, 20, width/2, height/3, ECounter));
  a = loadImage("../../Background/Background4.jpg");
}
void draw(){
  loopBackground();
  playerList.get(0).move();
  playerList.get(0).display();
  playerList.get(0).checkBoundaryCollision(enemyList.get(0));
  if (pShotList.size() > 0){
    pShotList.get(0).checkBoundaryCollision(enemyList.get(0),pShotList);
  }
  playerShoot();
  movePshots();
  displayPShot();
  println("Player's HP: " + playerList.get(0).HP);
  println("Enemy's HP: " + enemyList.get(0).HP);
  displayEnemy();
}

void keyPressed(){
  if (key == 'z'){
    keys[4] = true;
  }
  if (key == 'x'){
    keys[5] = true;
  }
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
    //if (keyCode == SHIFT){
    //  keys[5] = true;
    //}
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
      //if (keyCode == SHIFT){
      //  keys[5] = false;
      //}
  }
  if (key == 'z'){
    keys[4] = false;
  }
  if (key == 'x'){
    keys[5] = false;
  }
}
void playerShoot(){
  if (keys[4] == true && 40 - timer <= playerList.get(0).power){
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

void displayEShots(){
  int counter = 0;
  while (counter < eShotList.size()){
    eShotList.get(counter).display();
    counter += 1;
  }
}
void displayEnemy(){
  ECounter = 0;
  while (ECounter < enemyList.size()){
    enemyList.get(ECounter).display();
    ECounter += 1;
  }
}

void displayItem(){
  ICounter = 0;
  while (ICounter < itemList.size()){
    itemList.get(ICounter).display();
    ICounter += 1;
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


