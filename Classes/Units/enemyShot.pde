class enemyShot extends Bullet{
 boolean contactPlayer;
 PImage eShotSprite;
  
 enemyShot(float x, float y,float velocityX,float velocityY){
    position.x = x;
    position.y=y;
    velocity.x=velocityX
    velocity.y=velocityY;
    eShotSprite = loadImage("../../Sprites/Bullets/Enemy/BulletSprites.png");
 }
 
 void checkBoundaryCollision(Player other){
   if (super.checkBoundaryCollision(other)){
     other.setHP(other.HP - 1);
   }
 }
 
 void moveBullet(){
   position.y += velocity.y;
   position.x += velocity.x;
 }
 void display(int x,int y,int eWidth,int eHeight){
   image(eShotSprite.get(x,y,eWidth,eHeight),position.x-(eWidth / 2),position.y-(eHeight / 2));
 }
}
