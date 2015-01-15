class enemyShot extends Bullet{
 boolean contactPlayer;
 PImage eShotSprite;
 int eShotCounter;
  
 enemyShot(float x, float y,float velocityX,float velocityY,int newEShotCounter){
    position.x = x;
    position.y=y;
    velocity.x=velocityX;
    velocity.y=velocityY;
    eShotSprite = loadImage("../../Sprites/Bullets/Enemy/BulletSprites.png");
    eShotCounter = newEShotCounter;
 }
 
 void checkBoundaryCollision(Player other,ArrayList<enemyShot> EShotList){
   if (super.checkBoundaryCollision(other)){
     other.setHP(other.HP - 1);
     EShotList.remove(eShotCounter);
   }
 }
 
 void moveBullet(){
   position.y += velocity.y;
   position.x += velocity.x;
 }
 void display(){
   image(eShotSprite.get(1,32,18,20),position.x-9,position.y);
 }
}
