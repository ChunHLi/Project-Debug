class enemyShot extends Bullet{
 boolean contactPlayer;
 PImage eShotSprite;
 int eShotCounter;
 float vel;
  
 enemyShot(float x, float y,float nvel, int newEShotCounter, ArrayList<Player> whatever){
    position.x = x;
    position.y=y;
    vel = nvel;
    eShotSprite = loadImage("../../Sprites/Bullets/Enemy/BulletSprites.png");
    eShotCounter = newEShotCounter;
    calcVXY(whatever.get(0));
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
 void calcVXY(Player other){
  float angle;
  float dx = position.x - other.position.x;
  float dy = position.y - other.position.x;
  angle = atan(dx / dy);
  velocity.x = (vel * sin(angle));
  velocity.y = (vel * cos(angle));
 }

 void display(){
   image(eShotSprite.get(1,32,18,20),position.x-9,position.y);
 }
}
