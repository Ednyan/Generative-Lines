void settings(){
  fullScreen(P2D,1);
  smooth(10);

}
Dots[] d = new Dots[1000];
Interface ui = new Interface();
Square s = new Square();
CheckBox limits_visibility;
float distance;
float distance2;
float distance3;
float distance4;
float distance5;
float xcoordj;
float ycoordj;
float zcoordj;
float xcoordk;
float ycoordk;
float zcoordk;
float xcoords1;
float ycoords1;
float xcoords2;
float ycoords2;
float xcoords3;
float ycoords3;
float xcoords4;
float ycoords4;
int random_num;
int number_points;
int number_clicks;
float distance_length;
int distance_length2;
int connect;
int max_connected;
boolean P;
boolean S;
boolean clear_points;
boolean randomize = false;
color randomcolor;
boolean epilepsy_colormode = false;
boolean normal_colormode = false;
boolean cool_psychedelic_colormode = true;
boolean mouseclicked = false;
float x;
float y;

int screensizeX;
int screensizeY;

int limits_circle_color=0;
float random_limit;

void setup(){
  textSize(128);
  pixelDensity(displayDensity());
  frameRate(60);
  surface.setResizable(true); 
  cp5 = new ControlP5(this);
  //SLIDERS
  ui.slider();
  number_points = 1000;
  number_clicks = 0;
  distance_length2 = 100;
  random_limit = int(ui.randompoints());
  println(random_limit);
  P = false;
  S = true;
  for(int i=0; i<number_points; i++){
    d[i] = new Dots();
  }
}

void draw(){
  background(0);
  max_connected = ui.connected();
  distance_length = ui.distance();
  random_limit = int(ui.randompoints());
  ui.disable_cursor();
  ui.slidersizevalues();
  ui.limits_circle_display();
  if(keyPressed && key == 'p'){
      P = true;
    }
  if(keyPressed && key == ' '){
      P = false;
    }
  if(keyPressed && key == 's'){
      S = false;
    }
  if(keyPressed && key == DELETE){
      S = true;
    }  
  
  for(int i=0; i<number_clicks; i++){
        if (P == false) {
          d[i].move();
        }
        d[i].display();
        for(int j=0; j<number_clicks; j++){
        xcoordj=d[j].xcoord();
        ycoordj=d[j].ycoord();
          for(int k=j+1; k<number_clicks; k++){
              xcoordk=d[k].xcoord();
              ycoordk=d[k].ycoord();
              //zcoordk=d[k].zcoord();
              distance = sqrt(sq(xcoordk - xcoordj) + sq(ycoordk - ycoordj)/*+sq(zcoordk - zcoordj)*/);
              if(distance <= ui.distance()){
                strokeWeight(1/*random(0.5,1)*/);
                
              //stroke(0, 195, 209);
              //stroke(185, 0, 209);
                if(epilepsy_colormode == true){
                stroke(colorrandom());
                }
                if(normal_colormode == true){
                stroke(randomcolor);
                }
                if(cool_psychedelic_colormode == true){
                stroke(d[i].randomcolor);
                }
              
                if(connect <= max_connected-1){
                line(xcoordj,ycoordj,/*zcoordj,*/xcoordk,ycoordk/*,zcoordk*/);
                connect++;
                }
              }
          }
              connect = 0;
        }
      //saveFrame("frame-######.png");
  }
    if(number_clicks < random_limit && randomize == true && mouseclicked == true){
      number_clicks++;
    }
    else{
      randomize = false;
    }
  if(S == false){
    s.create_square();
  }
  ui.keyTyped();
  ui.keypressed();
}


void mouseClicked(){
  mouseclicked = true;
  if(clear_points == true){
    number_clicks = 0;
    for(int i=0; i<number_points; i++){
    d[i] = new Dots();
    }
    clear_points = false;
  }
  if(randomize == false){
    if(ui.keypressed==false || mouseX>0.15*width){
    number_clicks = number_clicks +1;
    }
  }
}
void keyPressed(){
  if(key==27)
    key=0;
}
public void ApplySize() {
       ui.setvalue();
       if(ui.sizevalue() == 1){
       surface.setSize(640,480);
       }
       if(ui.sizevalue() == 2){
       surface.setSize(800,600);
       }
       if(ui.sizevalue() == 3){
       surface.setSize(1024,576);
       }
       if(ui.sizevalue() == 4){
       surface.setSize(1152,648);
       }
       if(ui.sizevalue() == 5){
       surface.setSize(1280,720);
       }
       if(ui.sizevalue() == 6){
       surface.setSize(1366,768);
       }
       if(ui.sizevalue() == 7){
       surface.setSize(1600,900);
       }
       if(ui.sizevalue() == 8){
       surface.setSize(1920,1080);
       }
       if(ui.sizevalue() == 9){
       surface.setSize(2560,1440);
       }
       if(ui.sizevalue() == 10){
       surface.setSize(3840,2160);
       }
       return;
   }
   
public void Quit(){
       ui.quit();
       return;
   }
public void Clear(){
       clear_points = true;
       return;
   }
public void Randomize(){
       
       randomize = true;

       return;
   }
   
public void RandomizeColor(){
       this.colorrandom();
       
       return;
   }
   color colorrandom(){
    randomSeed(int(random(0,999999999)));
    randomcolor= color(random(0,255),random(0,255),random(0,255)); 
    return randomcolor;
   }
   void controlEvent(ControlEvent theEvent) {
    if (theEvent.isFrom(limits_visibility)) {
      limits_circle_color = 255;
        int n = (int)limits_visibility.getArrayValue()[0];
        if(n==0) {
          limits_circle_color = 0;
        }
     }
   }
   int[] remove(int d[], int item) {
    int outgoing[] = new int[d.length - 1];
    System.arraycopy(d, 0, outgoing, 0, item);
    System.arraycopy(d, item+1, outgoing, item, d.length - (item + 1));
    return outgoing;
  }
  boolean randomize(){
    return randomize;
  }
