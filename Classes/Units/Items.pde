class Items extends Unit{

//Types: 0= P,; 1=Life; 2=Point; 3= Multiplier (Tentative addition); 4=Bomb

int type;
PImage itemSprite; 
int iCounter;

  Items(){
     position.x = width/4;
     position.y = height/3;
     setRadius(20);
     setGravity(.1);
     setType(0);
     itemSprite = loadImage("../../Sprites/Item/ItemSprites.png");
     iCounter = 0;
     velocity.y = -5;
     setTermVel(3);
  }
  
  Items(int newRad, float newGrav, int type, int ICounter,float newTVel){
    setRadius(newRad);
    setGravity(newGrav);
    setType(type);
    iCounter = ICounter;
    setTermVel(newTVel);
  }
  
  float collectionRadius,gravity, termVel;
  
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
     removeItem(iCounter);
   }
 }
  
  void setCollectionRadius(float newCollectionRadius){
    collectionRadius = newCollectionRadius;
  }
  void setGravity(float newGravity){
    gravity = newGravity;
  }
  void setType(int newType){
    type = newType;
  }
  void setTermVel(float newTermVel){
    termVel = newTermVel;
   }
   
   void display(){
     if (type == 0){ 
      image(itemSprite.get(40,1,16,16),position.x-8,position.y-8);
     }
     if (type == 1){ 
      image(itemSprite.get(1,1,16,16),position.x-8,position.y-8);
     }
     if (type == 2){ 
      image(itemSprite.get(1,20,16,16),position.x-8,position.y-8);
     }
     if (type == 3){ 
      image(itemSprite.get(20,20,16,16),position.x-8,position.y-8);
     }
     if (type == 4){ 
      image(itemSprite.get(20,1,16,16),position.x-8,position.y-8);
     }
  }
  
  void drop(){
    if (velocity.y < termVel){
      velocity.y += gravity;
    }
    position.y += velocity.y;    
  }
}
