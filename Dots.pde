class Dots{
  float x;
  float y;
  float z;
  float speed;
  float rand_x;
  float rand_y;
  float time;
  float time2;
  float pixel_range;
  float borders;
  float formula;
  boolean mouseclicked;
  color randomcolor;
  Interface settings = new Interface();
  Dots(){
    x = 100000;
    y = 100000;
   //z = random(0,100);
   speed = settings.speed();
   time2 = 0;
   pixel_range = settings.movement();
   borders = settings.limits();
   mouseclicked = false;
   colorrandom();
  }
  void mouseClicked(){
      x = mouseX;
      y = mouseY;
  }
  void move(){;
    if (mouseclicked ==false){
      mouseClicked();
      if(randomize() == true){
      x = random(0,width);
      y = random(0,height);
      }
      mouseclicked = true;
    }
    time = millis();
    if(time >= time2 + 500){
      if(x > width - settings.limits()){
        rand_x = (x + random(-settings.movement(),0));
      }
      if(x < settings.limits()){
        rand_x = (x + random(0,settings.movement()));
      }
      if(x >= settings.limits() && x <= width - settings.limits()){
        rand_x = (x + random(-settings.movement(),settings.movement()));
      }
      if(y < ((float(height)/width)*settings.limits())){
        rand_y = (y + random(0,settings.movement()));
      }
      if(y > height-((float(height)/width)*settings.limits())){
        rand_y = (y + random(-settings.movement(),0));
      }
      if(y <= height-((float(height)/width)*settings.limits()) && y >= ((float(height)/width)*settings.limits())){
        rand_y = (y + random(-settings.movement(),settings.movement()));
      }
      time2 = millis();
    }
      if (x < abs(rand_x)){
      x = x + settings.speed();
      }  
      if (x > abs(rand_x)){
        x = x - settings.speed();
      }  
      if (y < abs(rand_y)){
      y = y + settings.speed();
      }  
      if (y > abs(rand_y)){
        y = y - settings.speed();
      } 
   //x = x + random(-9,9);
   //y = y + random(-9,9);
   //z = z + random(-9,9);
  }
    
  void display(){
  stroke(255);
  fill(255);
  point(x,y/*,z*/);
  }
  
  float xcoord(){
    return x;
  }
  float ycoord(){
    return y;
  }
  color colorrandom(){
    randomcolor= color(random(0,255),random(0,255),random(0,255)); 
    return randomcolor;
  }
  /*float zcoord(){
    return z;
  }*/
}
