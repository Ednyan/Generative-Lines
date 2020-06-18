import controlP5.*;

ControlP5 cp5;
DropdownList screensize;
class Interface{
  float mousecoordX;
  float mousecoordY;
  float time;
  float cursor_time;
  float multiplier;
  color c;
  color r1;
  color r2;
  color r3;
  boolean H;
  boolean keypressed;
  
  int sliderinicialposition = 70;
  int sliderbetweenposition = 70;
  
  int sliderValue;
  int connect;
  
  float sliderDistance;
  float distance_length;
  
  float sliderSpeed;
  float speed;
  
  float sliderMovement;
  float movement;
  
  float sliderLimits;
  float limits;
  
  float sliderSize;
  float sizevalues;
  
  float sliderRandom_Points;
  float randompoints;
  
  float stroke_checkbox = 2;
  
  Interface(){
    cursor_time=0;
    multiplier=0;
    c = color(0,0,0);
    r1 = color(255,0,0);
    r2 = color(170,0,0);
    r3 = color(85,0,0);
    keypressed = false;
  }

  void slider(){
     cp5.addSlider("sliderValue")
     .setRange(0,100)
     .setValue(6)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(0) 
     .setCaptionLabel("Complexity")
     .setVisible(false);
     
     cp5.addSlider("sliderDistance")
     .setRange(0,width)
     .setValue(200)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(2) 
     .setCaptionLabel("Distance")
     .setVisible(false);
     
     cp5.addSlider("sliderSpeed")
     .setRange(0,20)
     .setValue(0.1)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(2) 
     .setCaptionLabel("Speed")
     .setVisible(false);
     
     cp5.addSlider("sliderMovement")
     .setRange(0,2000)
     .setValue(100)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(0) 
     .setCaptionLabel("Movement")
     .setVisible(false);
     
     cp5.addSlider("sliderLimits")
     .setRange(0,3840/2)
     .setValue(10)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(2) 
     .setCaptionLabel("Limits")
     .setVisible(false);
     
     cp5.addSlider("sliderSize")
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(0)
     .setCaptionLabel("Size:")
     .setColorValue(color(255,255,255,0))
     .setValue(8)
     .setVisible(false);
     if(displayHeight == 480){
     cp5.getController("sliderSize").setValue(1);
     }
     if(displayHeight == 600){
     cp5.getController("sliderSize").setValue(2);
     }
     if(displayHeight == 576){
     cp5.getController("sliderSize").setValue(3);
     }
     if(displayHeight == 648){
     cp5.getController("sliderSize").setValue(4);
     }
     if(displayHeight == 720){
     cp5.getController("sliderSize").setValue(5);
     }
     if(displayHeight == 768){
     cp5.getController("sliderSize").setValue(6);
     }
     if(displayHeight == 900){
     cp5.getController("sliderSize").setValue(7);
     }
     if(displayHeight == 1080){
     cp5.getController("sliderSize").setValue(8);
     }
     if(displayHeight == 1440){
     cp5.getController("sliderSize").setValue(9);
     }
     if(displayHeight == 2160){
     cp5.getController("sliderSize").setValue(10);
     }
     
     cp5.getController("sliderSize").setVisible(false);
     cp5.addButton("ApplySize")
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setCaptionLabel("Apply Size")
     .setVisible(false);
     
     cp5.addButton("Quit")
     .setValue(0)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setVisible(false);
     
     limits_visibility = cp5.addCheckBox("LimitVisibility")
                .setColorBackground(#300000)
                .setColorForeground(#300000)
                .setColorActive(#b00000)
                .addItem("Limits Visibility", color(255,255,255,0));
                limits_visibility.activate(0);
                limits_visibility.getItem(0).setVisible(false);
     
     cp5.addButton("Clear")
     .setValue(0)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setVisible(false); 
     
     cp5.addButton("Randomize")
     .setValue(0)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setVisible(false);
     
     cp5.addSlider("sliderRandom_Points")
     .setRange(0,200)
     .setValue(50)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setDecimalPrecision(0)
     .setCaptionLabel("Random Points")
     .setVisible(false);
     
     cp5.addButton("RandomizeColor")
     .setValue(0)
     .setColorBackground(#300000)
     .setColorForeground(#b00000)
     .setColorActive(#f00000)
     .setCaptionLabel("Randomize Color")
     .setVisible(false);
                
  }
  
  void disable_cursor(){

    time = millis();
    if((abs(mousecoordX-mouseX) <= 6)&&(abs(mousecoordY-mouseY) <= 10)&& mousePressed==false){
      if(time >= cursor_time + 3000){
      noCursor();
      cursor_time = millis();
      }
    }
    else{
      cursor(ARROW);
      mousecoordX = mouseX;
      mousecoordY = mouseY;
    }
  }
  void menu_design(){
    noStroke();
        fill(c,230);
        rect(0,0,width*multiplier, height);
        fill(r1,230);
        rect(width*multiplier,0,3, height);
        fill(r2,230);
        rect(width*multiplier,0,2, height);
        fill(r3,230);
        rect(width*multiplier,0,1, height);
          if(multiplier > 0.025 && keypressed == true){
            fill(255,255,255,230);
            textSize(20*(float(width)/1920));
            text("OPTIONS", width/-9.9 + multiplier*width,(sliderinicialposition-35)*(float(height)/1080));
            color(255);
            slider_visibility();
            cp5.getController("sliderValue").setPosition(width/-7.14 + multiplier*width,sliderinicialposition*(float(height)/1080));
            cp5.getController("sliderDistance").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition)*(float(height)/1080));
            cp5.getController("sliderSpeed").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*2)*(float(height)/1080));
            cp5.getController("sliderMovement").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*3)*(float(height)/1080));
            cp5.getController("sliderLimits").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*4)*(float(height)/1080));
            cp5.getController("sliderSize").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*11)*(float(height)/1080));
            cp5.getController("ApplySize").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*11+40)*(float(height)/1080));
            cp5.getController("Quit").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*13+30)*(float(height)/1080));
            cp5.getController("Clear").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*6+30)*(float(height)/1080));
            cp5.getController("Randomize").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*6.5+30)*(float(height)/1080));
            cp5.getController("RandomizeColor").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*8+30)*(float(height)/1080));
            cp5.getController("sliderRandom_Points").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*7+30)*(float(height)/1080));
            limits_visibility.getItem(0).setPosition(width/-7.1 + multiplier*width,(sliderinicialposition+sliderbetweenposition*4+40)*(float(height)/1080));
            square((width/-7.1 + multiplier*width)-(stroke_checkbox/2), ((sliderinicialposition+sliderbetweenposition*4+40)*(float(height)/1080))-(stroke_checkbox/2), height/50+stroke_checkbox);
          }
          if(multiplier > 0.05 && keypressed == false){
            fill(255,255,255,230);
            textSize(20);
            text("OPTIONS", width/-9.9 + multiplier*width,(sliderinicialposition-35)*(float(height)/1080));
            color(255);
            slider_visibility();
            cp5.getController("sliderValue").setPosition(width/-7.14 + multiplier*width,sliderinicialposition*(float(height)/1080));
            cp5.getController("sliderDistance").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition)*(float(height)/1080));
            cp5.getController("sliderSpeed").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*2)*(float(height)/1080));
            cp5.getController("sliderMovement").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*3)*(float(height)/1080));
            cp5.getController("sliderLimits").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*4)*(float(height)/1080));
            cp5.getController("sliderSize").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*11)*(float(height)/1080));
            cp5.getController("ApplySize").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*11+40)*(float(height)/1080));
            cp5.getController("Quit").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*13+30)*(float(height)/1080));
            cp5.getController("Clear").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*6+30)*(float(height)/1080));
            cp5.getController("Randomize").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*6.5+30)*(float(height)/1080));
            cp5.getController("RandomizeColor").setPosition(width/-8.85 + multiplier*width,(sliderinicialposition+sliderbetweenposition*8+30)*(float(height)/1080));
            cp5.getController("sliderRandom_Points").setPosition(width/-7.14 + multiplier*width,(sliderinicialposition+sliderbetweenposition*7+30)*(float(height)/1080));
            limits_visibility.getItem(0).setPosition(width/-7.1 + multiplier*width,(sliderinicialposition+sliderbetweenposition*4+40)*(float(height)/1080));
            square((width/-7.1 + multiplier*width)-stroke_checkbox/2 , ((sliderinicialposition+sliderbetweenposition*4+40)*(float(height)/1080))-stroke_checkbox/2 , height/50+stroke_checkbox);
          }
  }
  
  
  
  
  void keyTyped(){
    cp5.getController("sliderValue").setSize(width/8,height/100);
    cp5.getController("sliderDistance").setSize(width/8,height/100);
    cp5.getController("sliderSpeed").setSize(width/8,height/100);
    cp5.getController("sliderMovement").setSize(width/8,height/100);
    cp5.getController("sliderLimits").setSize(width/8,height/100);
    cp5.getController("sliderSize").setSize(width/8,height/80);
    cp5.getController("ApplySize").setSize(width/15,height/80);
    cp5.getController("Quit").setSize(width/15,height/50);
    cp5.getController("Clear").setSize(width/15,height/50);
    cp5.getController("Randomize").setSize(width/15,height/50);
    cp5.getController("RandomizeColor").setSize(width/15,height/50);
    cp5.getController("sliderRandom_Points").setSize(width/8,height/80);
    limits_visibility.getItem(0).setSize(height/50,height/50);
    if(key == 'm' || key == 'M'){
        if(multiplier <= 0.15){
          multiplier = multiplier + 0.008;
        }
        keypressed = true;
        menu_design();

    }
    if(keyCode == ESC){
      if(multiplier > 0){
        multiplier = multiplier - 0.008;
      }
      keypressed = false;
      menu_design();
    }
    else if(keypressed == true && key != 'm' && keyCode != ESC){
      multiplier = 0.1525;
      menu_design();
    }
    
  }
    void slider_visibility(){
     if(keypressed == false){
     cp5.getController("sliderValue").setVisible(false);
     
     cp5.getController("sliderDistance").setVisible(false);
     
     cp5.getController("sliderSpeed").setVisible(false);
     
     cp5.getController("sliderMovement").setVisible(false);
     
     cp5.getController("sliderLimits").setVisible(false);
     
     cp5.getController("sliderSize").setVisible(false);
     
     cp5.getController("ApplySize").setVisible(false);
     
     cp5.getController("Quit").setVisible(false);
     
     cp5.getController("Clear").setVisible(false);
     
     cp5.getController("Randomize").setVisible(false);
     
     cp5.getController("RandomizeColor").setVisible(false);
     
     cp5.getController("sliderRandom_Points").setVisible(false);
     
     limits_visibility.getItem(0).setVisible(false);
     
     }
     if(keypressed == true){
     cp5.getController("sliderValue").setVisible(true);
     
     cp5.getController("sliderDistance").setVisible(true);
     
     cp5.getController("sliderSpeed").setVisible(true);
     
     cp5.getController("sliderMovement").setVisible(true);
     
     cp5.getController("sliderLimits").setVisible(true);
     
     cp5.getController("sliderSize").setVisible(true);
     
     cp5.getController("ApplySize").setVisible(true);
     
     cp5.getController("Quit").setVisible(true);
     
     cp5.getController("Clear").setVisible(true);
     
     cp5.getController("Randomize").setVisible(true);
     
     cp5.getController("RandomizeColor").setVisible(true);
     
     cp5.getController("sliderRandom_Points").setVisible(true);
     
     limits_visibility.getItem(0).setVisible(true);
     
     }
     
     
      // reposition the Label for controller 'slider'
      cp5.getController("sliderValue").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      cp5.getController("sliderValue").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      
      cp5.getController("sliderDistance").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      cp5.getController("sliderDistance").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      
      cp5.getController("sliderSpeed").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      cp5.getController("sliderSpeed").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      
      cp5.getController("sliderMovement").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      cp5.getController("sliderMovement").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      
      cp5.getController("sliderLimits").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      cp5.getController("sliderLimits").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      
      cp5.getController("sliderRandom_Points").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      cp5.getController("sliderRandom_Points").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
      
      cp5.getController("sliderSize").getValueLabel().align(ControlP5.CENTER, ControlP5.CENTER).setPaddingX(0);
      cp5.getController("sliderSize").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setPaddingX(20);
    }
    
    
    int connected(){
      connect = round(cp5.getValue("sliderValue"));
      return connect;
    }
    float distance(){
      distance_length = cp5.getValue("sliderDistance");
      return distance_length;
    }
    float speed(){
      speed = cp5.getValue("sliderSpeed");
      return speed;
    }
    float movement(){
      movement = cp5.getValue("sliderMovement");
      return movement;
    }
    float limits(){
      limits = cp5.getValue("sliderLimits");
      return limits;
    }
    float sizevalues(){
      sizevalues = cp5.getValue("sliderSize");
      return sizevalues;
    }
    float randompoints(){
      randompoints = cp5.getValue("sliderRandom_Points");
      return randompoints;
    }
    boolean keypressed(){
      return keypressed;
    }
    
   void slidersizevalues() {
      if(sizevalue() == 1){
        cp5.getController("sliderSize").setCaptionLabel("Size: 640 X 480");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 2){
        cp5.getController("sliderSize").setCaptionLabel("Size: 800 X 600");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 3){
        cp5.getController("sliderSize").setCaptionLabel("Size: 1024 X 576");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 4){
        cp5.getController("sliderSize").setCaptionLabel("Size: 1152 X 648");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 5){
        cp5.getController("sliderSize").setCaptionLabel("Size: 1280 X 720");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 6){
        cp5.getController("sliderSize").setCaptionLabel("Size: 1366 X 768");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 7){
        cp5.getController("sliderSize").setCaptionLabel("Size: 1600 X 900");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 8){
        cp5.getController("sliderSize").setCaptionLabel("Size: 1920 X 1080");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 9){
        cp5.getController("sliderSize").setCaptionLabel("Size: 2560 X 1440");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
      
      
      if(sizevalue() == 10){
        cp5.getController("sliderSize").setCaptionLabel("Size: 3840 X 2160");
        if(cp5.getController("sliderLimits").getValue() > width/2){
        cp5.getController("sliderLimits").setValue(width/2);
        }
      }
   }
   
   int sizevalue(){
    return round(cp5.getController("sliderSize").getValue());
  }
  
  void setvalue(){
    if(ui.sizevalue() < 1 ){
         cp5.getController("sliderSize").setValue(1);
       }
    if(ui.sizevalue() > 10 ){
         cp5.getController("sliderSize").setValue(10);
       }
  }
  void quit(){
    if(keypressed == true){
      exit();
    }
  }
  void limits_circle_display(){
    pushMatrix();
    fill(color(255,255,255,limits_circle_color));
    noStroke();
    circle(width - limits(),(float(height)/width)*limits(),20);
    circle(limits(),(float(height)/width)*limits(),20);
    circle(width - limits(),height-(float(height)/width)*limits(),20);
    circle(limits(),height-(float(height)/width)*limits(),20);
    popMatrix();
  }
}
