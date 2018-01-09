/*
Title: Whales In Love
 Imagined, Designed, and Programmed by: Courtney Peterson
 Date: March 9, 2016
 
 Description: 
 
 This code in Processing illustrates repeated images of two whales in love. 
 This code will be printed on fabric and used to make a zipper pouch. 
 In order to create this textile, I used three different functions I constructed: drawing a single whale, a heart, and the whale couple and heart.
 I used many bezier curves in my functions in order to achieve the curves of the whale's body and heart.
 
 Sources of ideas and inspiration (title, author, URL):
 * Dianne Dehalhunty (inspiration for the pattern) http://www.diannedelahunty.com/childrens-graphics
 
 Includes code from (title, author, URL):
 * Bezier Curve Code Generator, Natalie Freed, https://gist.github.com/nataliefreed/acd1260d0a899174094c
 * Pixels To Inches Output Function, Natalie Freed, https://gist.github.com/nataliefreed/93ebf456174863666977
 * Exporting Design Code, Natalie Freed, https://docs.google.com/document/d/1QWzfxIEBNf9iNXtfiIIXU_4ekalOnk4X_czRK6S5D3M/edit
 
 */

void setup() {
  size(1872, 1710);
  background(255, 255, 255);
  println(inchesToPixels(12)); //the size of the fabric I want converted into pixels
  println(inchesToPixels(12));
  fill(255, 255, 255);  //white-filled rectangle to allow the grid numbers to show up
  noStroke();
  rect(0, 0, 75, 30);
  fill(45, 12, 159);  //grid number color
  text(mouseX + ", " + mouseY, 20, 20); //grid numbers on top left

  for (int row = 0; row < 40; row++) { //creating blocks and looping
    pushMatrix();
    if (row % 2 == 0) {
      //even numbered rows
    } else { 
      translate(-173, 0);//odd numbered rows
    }

    for (int column = 0; column <= 20; column++) {
      drawWhalesAndHeart();
      translate(340, 0);
    }
    popMatrix();
    translate(0, 130);
  }
}

void draw() {
}


void drawWhalesAndHeart() {
  pushMatrix();
  scale(.5, .5);
  translate(300, 0);
  translate(0, 30);
  drawaWhale(color(148, 208, 252));
  drawHeart(color(255, 0, 0));
  scale(-1, 1);
  translate(-80, 0);
  drawaWhale(color(255, 209, 239));
  popMatrix();
}

void drawaWhale(color c) {

  fill(0);
  beginShape();//head curve
  fill(c);
  stroke(0);
  strokeWeight(5);
  vertex(86, 167);//starting point
  bezierVertex(52, -3, 255, 32, 268, 147);  //back to tail curve
  bezierVertex(269, 194, 303, 176, 309, 168);  //top of left tail curve
  bezierVertex(308, 133, 342, 132, 346, 130);  //bottom of left tail curve
  bezierVertex(342, 132, 357, 161, 330, 172);  //top of right tail curve
  bezierVertex(347, 166, 364, 168, 371, 183);  //bottom of left tail curve
  bezierVertex(363, 192, 342, 206, 321, 190);  //bottom right half of whale curve
  bezierVertex(312, 206, 253, 224, 218, 218);  //fin curve
  bezierVertex(226, 254, 201, 241, 179, 216);  //bottom left half of whale curve
  bezierVertex(182, 218, 127, 220, 94, 179);  //bottom part of smile curve
  bezierVertex(115, 177, 130, 170, 139, 153);  //top part of smile curve
  bezierVertex(126, 162, 110, 169, 86, 167);
  endShape();

  fill(255, 255, 255);
  ellipse(146, 119, 15, 22);//outer eye

  fill(0);
  ellipse(143, 123, 6, 6);//inner eye

  noFill();
  strokeWeight(2.75);
  ellipse(156, 61, 20, 10);//blow hole

  beginShape();//left water spray--base
  vertex(157, 60);
  bezierVertex(160, 3, 129, 6, 123, 23); //left water spray--first curve
  bezierVertex(119, 38, 138, 33, 138, 27); //left water spray--second curve
  bezierVertex(144, 23, 126, 22, 131, 27); //left water spray--third curve
  endShape();

  beginShape();//right water spray--base
  vertex(156, 35);
  bezierVertex(157, 10, 195, 20, 175, 39); //right water spray--first curve
  bezierVertex(151, 38, 172, 13, 172, 32); //right water spray--second curve
  endShape();
}

void drawHeart(color c) {
  fill(c);//heart color 
  beginShape();
  vertex(40, 155); 
  bezierVertex(40, 130, 85, 140, 40, 180); //right side of heart
  bezierVertex(-5, 140, 40, 130, 40, 155); //left side of heart
  endShape();
}

void mousePressed() //click the mouse to save your design
{
  saveFrame("FINAL Courtney Peterson Whale Textile Project" + millis() + ".png");
}


float inchesToPixels(float in) {
  float ppi = 150 ; //pizels per inch 
  return ppi * in;
}