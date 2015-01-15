class Items extends Unit{

//Types: 0= P,; 1=Life; 2=Point; 3= Multiplier (Tentative addition); 4=Bomb

int type;
PImage itemSprite; 
 
  Items(){
     setRadius(10);
     setCollectionRadius(15);
     setGravity(4);
     setType(0);
     itemSprite = loadImage("../../Sprites/Item/ItemSprites.png");
     
  }
  
  Items(int newRadius, int newColRad, int newGrav, int type){
    setRadius(newRadius);
    setCollectionRadius(newColRad);
    setGravity(newGrav);
    setType(type);
  }
  
  int collectionRadius,gravity;
  
  void checkBoundaryCollision(Player other){
   if (super.checkBoundaryCollision(other)){
     if (type == 0){
       other.setPower(other.power + 5);
     }
     if (type == 1){
       other.setLives(other.Lives + 1);
     }
     if (type==2){
      other.setScore(other.Score + 50000);
     }
     if (type==3){
      other.setMultiplier(other.multiplier + 1);
     }
     if (type==4){
      other.setBombs(other.Bombs + 1);
     }
   }
 }
  
  void setCollectionRadius(int newCollectionRadius){
    collectionRadius = newCollectionRadius;
  }
  void setGravity(int newGravity){
    gravity = newGravity;
  }
  void setType(int newType){
    type = newType;
   }
}
