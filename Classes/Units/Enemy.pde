class Enemy extends Unit{
  
  Enemy(){
    setHP(50);
    setRadius(10);
    position.x = 2*width/3;
    position.y = height/2;
  }
  
  Enemy(int nHP, int nRadius){
    setHP(nHP);
    setRadius(nRadius);
  }
  
  void checkBoundaryCollision(Bullet other){
  }
  
  void shootBullet(){
  }
}
  
