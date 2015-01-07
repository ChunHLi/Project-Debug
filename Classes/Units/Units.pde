class Units{
  int HP, hitboxH, hitboxL,spawnX,spawnY;
  PVector position,velocity;
  
  //Don't make it abstract, makes it difficult;
  Units(){
  }
  
  Units(){
  }
  
  void hitdetect(){
  }
  void setHP(int newHP){
    HP = newHP;
  }
  void sethitboxH(int newH){
    hitboxH = newH;
  }
  void sethitboxL(int newL){
    hitboxL = newL;
  }
  void setSpawnX(int newSpawnX){
  }
  void setSpawnY(int newSpawnY){
  }
  void checkBoundaryCollision(){
  }
}
