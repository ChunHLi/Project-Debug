class Enemy extends Unit{
  
  Enemy(){
    setHP(50);
    sethitboxH(10);
    sethitboxL(8);
  }
  
  Enemy(int nHP, int nHitH, int nHitL){
    setHP(nHP);
    sethitboxH(nHitH);
    sethitboxL(nHitL);
  }
  
  void checkBoundaryCollision(Bullet other){
  }
  
  void shootBullet(){
  }
}
  
