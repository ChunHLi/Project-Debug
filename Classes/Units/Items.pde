class Items extends Unit{

//Types: 0= P(small),; 1=P(large); 2=Point; 3= Multiplier (Tentative addition)

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
       other.setPower(other.power + 10);
     }
     if (type==2){
      other.setScore(other.Score + 50000);
     }
     if (type==3){
      other.setMultiplier(other.multiplier + 1);
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
