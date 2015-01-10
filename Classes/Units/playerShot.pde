class playerShot extends Bullet{
 boolean contactEnemy;
  
 playerShot(float x, float y,float velocityY){
    position.x = x;
    position.y=y;
    velocity.y=velocityY;
    velocity.x=0;
 }
 
 void moveBullet(){
   position.y -= velocity.y;
 }
}
