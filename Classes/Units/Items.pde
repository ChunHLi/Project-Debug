class Items extends Unit{
 
  Items(){
     sethitboxH(5);
     sethitboxL(5);
     setCollectionRadius(15);
     setGravity(4);
  }
  
  Items(int newHitH, int newHitL, int newColRad, int newGrav){
    sethitboxH(newHitH);
    sethitboxL(newHitL);
    setCollectionRadius(newColRad);
    setGravity(newGrav);
  }
  
  int collectionRadius,gravity;
  
  void setCollectionRadius(int newCollectionRadius){
    collectionRadius = newCollectionRadius;
  }
  void setGravity(int newGravity){
    gravity = newGravity;
  }
}
