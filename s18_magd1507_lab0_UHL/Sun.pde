class Sun {
 
  float s = 0.0;
  float a = 0.0;
  
 void display() {
 pushMatrix();
  //this will make the sun spin, and scale up and down
  translate(width*0.85, height*0.2);
  rotate(frameCount / -100.0);
  a = a + 0.04;
  s = cos(a)*2;
  scale(s);
  //farthest sat portion of sun
  fill(240,118,36);
  star(0,0,30,70,10);
  //orange part of the star
  fill(250,255,5);
  star(0, 0, 30, 70, 5);
  //middle circle of the sun
  noStroke();
  fill(255,189,5);
  ellipse(0,0,70,70);
  popMatrix();

 }

  void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
}