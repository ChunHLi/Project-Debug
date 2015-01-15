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
    pShotSprite = loadImage("../../Sprites/Bullets/Enemy/BulletSprites.png");
    pShotCounter = newPShotCounter;
 }
 
 void checkBoundaryCollision(Enemy other, ArrayList<playerShot> PShotList){
   if (super.checkBoundaryCollision(other)){
     other.setHP(other.HP - power);
     PShotList.remove(pShotCounter);
   }
 }
 
 void moveBullet(){
   position.y -= velocity.y;
 }
 void display(){
   image(pShotSprite.get(1,32,18,20),position.x-9,position.y);
 }
}
