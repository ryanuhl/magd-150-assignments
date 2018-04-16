float time = 0;
Ball ball;
PVector gravity = new PVector(0, 0.5);
int segments = 40;
Ground[] ground = new Ground[segments];
Sun sun;


void setup(){
  size(500,500);
   surface.setResizable(true);
   ball = new Ball(60,60,5);
   sun = new Sun();
   
   //Took the ball and ground idea from processing.org/reflection2
   float[] peakHeights = new float[segments+1];
  for (int i=0; i<peakHeights.length; i++){
    peakHeights[i] = random(height-110, height-90);
  }

  float segs = segments;
  for (int i=0; i<segments; i++){
    ground[i]  = new Ground(width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
  }
   
}

void draw(){
  
  //setting up the class to work in the main tab
  noStroke();
  fill(21,230,255);
  rect(0,0,width,height);
  ball.move();
  ball.display();
  ball.checkWallCollision();
  sun.display();
  
  //what happens when the ball hits the ground
  for (int i=0; i<segments; i++){
  ball.checkGroundCollision(ground[i]);
  }
  
  // this is the rocky hills the ball is bouncing off of
  fill(205,133,63);
  beginShape();
  for (int i=0; i<segments; i++){
    vertex(ground[i].x1, ground[i].y1);
    vertex(ground[i].x2, ground[i].y2);
  }
  vertex(ground[segments-1].x2, height);
  vertex(ground[0].x1, height);
  endShape(CLOSE);
 }