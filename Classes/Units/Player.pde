//All players are 40px by 60px

class Player extends Unit{
  int Lives, Bombs, LCount, BCount, Score;
  boolean invuln;
  PImage playerSprite;
  int invulnTime, power, multiplier;
  
  Player(){
    setLives(3);
    setBombs(3);
    setLCount(0);
    setBCount(0);
    setScore(0);
    setRadius(5);
    setPower(0);
    setMultiplier(1);
    position.x = width/2;
    position.y = height/2;
    velocity.x = 4;
    velocity.y = 4;
    keys = new boolean[6];
    keys[0] = false;
    keys[1] = false;
    keys[2] = false;
    keys[3] = false;
    keys[4] = false;
    keys[5] = false;
    playerSprite = loadImage("../../Sprites/Player/Tohka/Base_Tohka.png");
    invuln = false;
  }
  
  Player(int nLives, int nBombs, int nPower, int nLCount, int nBCount, int nScore){
    setLives(nLives);
    setBombs(nBombs);
    setLCount(nLCount);
    setBCount(nBCount);
    setScore(nScore);
  }
  
  void setPower(int nPower){
    power = nPower;
  }
  
  void setLives(int newLives){
    Lives = newLives;
  }
  
  void setBombs(int newBombs){
    Bombs = newBombs;
  }
  
  void setLCount(int newLCount){
    LCount = newLCount;
  }
  
  void setBCount(int newBCount){
    BCount = newBCount;
  }
  
  void setScore(int newScore){
    Score = newScore;
  }
  
  void setMultiplier(int newMultiplier){
    multiplier = newMultiplier;
  }
  
  void checkBoundaryCollision(Enemy other){
    if (invulnTime > 0){
      invulnTime -= 1;
    }
    else if (super.checkBoundaryCollision(other)){
      setHP(HP - 1);
      invulnTime = 120;
    }
  }
  
  void moveUp(){
    if (position.y - velocity.y > 0){
      if (keys[5]){
        position.y -= velocity.y/2;
      }
      else{
        position.y -= velocity.y;
      }
    }
  }
  
  void moveDown(){
    if (position.y + velocity.y < height){
      if (keys[5]){
        position.y += velocity.y/2;
      }
      else{
        position.y += velocity.y;
      }
    }
  }
  
  void moveLeft(){
    if (position.x - velocity.x > 0){
      if (keys[5]){
        position.x -= velocity.x/2;
      }
      else{
        position.x -= velocity.x;
      }
    }
  }
  
  void moveRight(){
    if (position.x + velocity.x < width){
      if (keys[5]){
        position.x += velocity.x/2;
      }
      else{
        position.x += velocity.x;
      }
    }
  }
  void move(){
    if (keys[0]){
      moveUp();
    }
    if (keys[1]){
      moveDown();
    }
    if (keys[2]){
      moveLeft();
    }
    if (keys[3]){
      moveRight();
    }
    //background(103);
  }
  //void keyReleased(){
  //  if (key == CODED){
  //    if (keyCode == UP){
  //      keys[0] = false;
  //    }
  //    else if (keyCode == DOWN){
  //      keys[1] = false;
  //    }
  //    else if (keyCode == LEFT){
  //      keys[2] = false;
  //   }
  //    else if (keyCode == RIGHT){
  //      keys[3] = false;
  //    }
  //    keyCode = ' ';
  //  }
  //}
  void display(){
    image(playerSprite,position.x-20,position.y-30);
    if (keys[5]){
      super.display();
      
    }
  }
}
