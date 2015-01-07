class Player extends Unit{
  int Lives, Bombs, Power, LCount, BCount, Score;
  boolean FullPower, invuln;
  
  Player(){
    setLives(3);
    setBombs(3);
    setPower(0);
    setLCount(0);
    setBCount(0);
    setScore(0);
  }
  
  Player(int nLives, int nBombs, int nPower, int nLCount, int nBCount, int nScore){
    setLives(nLives);
    setBombs(nBombs);
    setLCount(nLCount);
    setBCount(nBCount);
    setScore(nScore);
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
  
  void checkBoundaryCollision(Items others){
  }
  
  void checkBoundaryCollision(Bullet others){
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
