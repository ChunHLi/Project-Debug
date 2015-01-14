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
  
  Items(int newRadius, int newColRad, int newGrav){
    setRadius(newRadius);
    setCollectionRadius(newColRad);
    setGravity(newGrav);
  }
  
  int collectionRadius,gravity;
  
  void checkBoundaryCollision(Player other){
   if (super.checkBoundaryCollision(other)){
     if (type==0){
      other.setPower(power + 1);
     }
     else if (type==2){
      other.setScore(Score + 50000);
     }
     else if (type==3){
      other.setPower(power + 10);
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
