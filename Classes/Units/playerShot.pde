class playerShot extends Bullet{
 boolean contactEnemy;
 PImage pShotSprite;
 boolean FullPower;
 int pShotCounter;
  
 playerShot(float x, float y,float velocityY,int newPShotCounter){
    position.x = x;
    position.y=y;
    velocity.y=velocityY;
    velocity.x=0;
    pShotCounter = newPShotCounter;
 }
 
 void checkBoundaryCollision(Enemy other, ArrayList<playerShot> PShotList){
   if (position.y - velocity.y < 0){
     removePShot(pShotCounter);
   }
   if (super.checkBoundaryCollision(other)){
     other.setHP(other.HP - power);
     removePShot(pShotCounter);
     playerList.get(0).Score += 100;
   }
 }
 
 void moveBullet(){
   position.y -= velocity.y;
 }
 void display(){
   stroke(0);
   fill(68,6,62);
   ellipse(position.x,position.y,radius*2,radius*2);
   fill(210,28,192);
   noStroke();
   ellipse(position.x + .5,position.y + .5,radius*1, radius * 1);
 }
}
