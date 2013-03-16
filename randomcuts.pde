/**
 * Random cuts
 *
 * Creative Commons License (by-nc-sa)
 *
 * (C) 2013 by Catodo
 * http://www.catodo.net
 */

import controlP5.*;

float colR, colG, colB, sizeBar;
boolean horizontal = true, vertical;

ControlP5 cp5;
Accordion accordion;
Knob myKnobA;
CheckBox checkbox;

void setup() {
  size(800,600);
  background(0);
  frameRate(10);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  gui();
}

void draw() {
  strokeWeight(frameCount % sizeBar);
  if (frameCount % 2 == 0) {
    stroke(colR, colG, colB,frameCount % 180);
  } else {
    stroke(0);
  }

  if (horizontal) {
    Xcuts(random(height/2));
  }
  if (vertical) {
    Ycuts(random(width/2));
  }
}

void Xcuts(float l) {
  float y1,y2;
  y1 = random(0, l);
  while (y1<height) {
    y2 = y1 + random(-l/2, l/2);
    line (0, y1, width, y2);
    y1 = l + max(y1, y2);
  }
}

void Ycuts(float l) {
  float x1,x2;
  x1 = random(0, l);
  while (x1 < width) {
    x2 = x1 + random(-l/2, l/2);
    line (x1, 0, x2, height);
    x1 = l + max(x1, x2);
  }
}

void gui() {
  cp5 = new ControlP5(this);
  
  Group g1 = cp5.addGroup("Parameters")
                .setBackgroundColor(color(0,64))
                .setHeight(20)
                .setBackgroundHeight(300);
  
  int xsize = width/5;
  
  cp5.addSlider("Red")
     .setPosition(0,5)
     .setRange(0,255)
     .setValue(255)
     .setWidth(xsize)
     .setHeight(30)
     .setColorActive(color(255,0,0))
     .moveTo(g1)
     ;
     
  cp5.addSlider("Green")
     .setPosition(0,40)
     .setRange(0,255)
     .setValue(255)
     .setWidth(xsize)
     .setHeight(30)
     .setColorActive(color(0,255,0))
     .moveTo(g1)
     ;   
 
  cp5.addSlider("Blue")
     .setPosition(0,75)
     .setRange(0,255)
     .setValue(255)
     .setWidth(xsize)
     .setHeight(30)
     .setColorActive(color(0,0,255))
     .moveTo(g1)
     ;   
  
  myKnobA = cp5.addKnob("Size")
               .setRange(0,height/2)
               .setValue(height/4)
               .setPosition(35,130)
               .setRadius(45)
               .setDragDirection(Knob.VERTICAL)
               .setColorBackground(color(colR, colG, colB))
               .moveTo(g1)
               ;
               
  checkbox = cp5.addCheckBox("checkBox")
                .setPosition(5, 250)
                .setColorForeground(color(120))
                .setColorActive(color(255))
                .setColorLabel(color(255))
                .setSize(50, 30)
                .setItemsPerRow(2)
                .setSpacingColumn(40)
                .addItem("H", 1)
                .addItem("V", 0)
                .moveTo(g1)
                ;
                
  accordion = cp5.addAccordion("acc")
                 .setPosition(width-xsize-50,20)
                 .setWidth(xsize)
                 .setHeight(50)
                 .addItem(g1);
                 
 
  accordion.open(0,1,2);
  accordion.setCollapseMode(Accordion.MULTI);
}

void Red(float col) {
  colR = col;
  myKnobA.setColorBackground(color(colR, colG, colB));
}

void Green(float col) {
  colG = col;
  myKnobA.setColorBackground(color(colR, colG, colB));
}

void Blue(float col) {
  colB = col;
  myKnobA.setColorBackground(color(colR, colG, colB));
}

void Size(float s) {
  sizeBar = s;
}

void checkBox(float[] a) {
  horizontal = (a[0] == 1);
  vertical = (a[1] == 1);
}
