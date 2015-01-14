class Items extends Unit{
 
  Items(){
     setRadius(10);
     setCollectionRadius(15);
     setGravity(4);
  }
  
  Items(int newRadius, int newColRad, int newGrav){
    setRadius(newRadius);
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
