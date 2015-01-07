class Player extends Units{
  int Lives, Bombs, Power, LCount, BCount, Score;
  boolean FullPower;
  
  Player(){
  }
  
  Player(){
  }
  
  void setLives(int newLives){
    Lives = newLives;
  }
  
  void setBombs(int newBombs){
    Bombs = newBombs;
  }
  
  void setPower(int newPower){
    Power = newPower;
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
  
  void checkBoundaryCollision(Enemy others){
  }
  
  void checkBoundaryCollision(Item others){
  }
  
  void shootBullet(){
  }
  
  void deployBomb(){
  }
  
  void moveUp(){
  }
  
  void moveDown(){
  }
  
  void moveLeft(){
  }
  
  void moveRight(){
  }
}
