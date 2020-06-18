class Square{

  float size;


  Square(){
    size = 50/2; 
  }
  void create_square(){
    stroke(255,255,255,255);
    fill(0,125);
    point(mouseX-size,mouseY+size);
    point(mouseX+size,mouseY+size);
    point(mouseX+size,mouseY-size);
    point(mouseX-size,mouseY-size);
    line(mouseX-size,mouseY+size,mouseX+size,mouseY+size);
    line(mouseX+size,mouseY+size,mouseX+size,mouseY-size);
    line(mouseX+size,mouseY-size,mouseX-size,mouseY-size);
    line(mouseX-size,mouseY-size,mouseX-size,mouseY+size);
    rect(mouseX-size,mouseY-size,size*2,size*2);
  }
  float xcoord1(){
    return mouseX-size;
  }
  float xcoord2(){
    return mouseX+size;
  }
  float xcoord3(){
    return mouseX+size;
  }
  float xcoord4(){
    return mouseX-size;
  }
  float ycoord1(){
    return mouseY+size;
  }
  float ycoord2(){
    return mouseY+size;
  }
  float ycoord3(){
    return mouseY-size;
  }
  float ycoord4(){
    return mouseY-size;
  }
}
