Unit Test;
Player Test2;
ArrayList<Player> playerList = new ArrayList<Player>(0);
ArrayList<playerShot> pShotList = new ArrayList<playerShot>(0);
ArrayList<Enemy> enemyList = new ArrayList<Enemy>(0);
ArrayList<Items> itemList = new ArrayList<Items>(0);
int counter = 0;
int Ecounter = 0;
int Icounter = 0;


void setup(){
  frameRate(60);
  size(640,320);
  smooth();
  background(103);
  Test = new Unit();
  Test2 = new Player();
  playerList.add(Test2);
}
void draw(){
  //Test.move();
  //Test.display();
  Test2.keyPressed();
  Test2.move();
  Test2.display();
  Test2.keyReleased();
  movePshots();
  displayPShot();
  if (counter < 5){
    counter += 1;
  }
}

//void playerShoot(){
//   }
//}

void keyPressed(){
  if (counter  == 5){
    if (key == 'z'){
      playerShot newPShot = new playerShot(playerList.get(0).position.x, playerList.get(0).position.y - playerList.get(0).velocity.y*3,playerList.get(0).velocity.y);
      pShotList.add(newPShot);
      counter = 0;
    }
    //if (key == 'x'){
    //  playerShot newPShot = new playerShot(playerList.get(0).position.x - playerList.get(0).velocity.x, playerList.get(0).position.y - playerList.get(0).velocity.y*3,playerList.get(0).velocity.y);
    //  pShotList.add(newPShot);
    //  counter = 0;
    //}
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
  
void displayEnemy(){
  int Ecounter = 0;
  while (Ecounter < enemyList.size()){
    enemyList.get(Ecounter).display();
    Ecounter += 1;
  }
}

void displayItem(){
  int Icounter = 0;
  while (Icounter < itemList.size()){
    itemList.get(Icounter).display();
    Icounter += 1;
  }
}
