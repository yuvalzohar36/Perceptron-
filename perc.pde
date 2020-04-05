Perceptron perceptron;
Point[] points = new Point[200];


void setup(){
  size(600,600);
  perceptron = new Perceptron(3);

  for ( int i = 0; i < points.length;i++){
    points[i] = new Point();
  }
}


void draw(){
  background(255);
  stroke(51);
  //line(0,height,width,0);
  Point p1 = new Point (-1,f(-1));
  Point p2 = new Point (1, f(1));
  line (p1.pixelX(),p1.pixelY(),p2.pixelX(),p2.pixelY());
  
  Point p3 = new Point(-1, perceptron.guessY(-1));
  Point p4 = new Point(1, perceptron.guessY(1));
  line(p3.pixelX(),p3.pixelY(),p4.pixelX(),p4.pixelY());
   
  
  for (Point p: points){
    p.show();
    float[] new_inputs = {p.x, p.y, p.bias};
    int target = p.label;
    int guess = perceptron.guess(new_inputs);
    //perceptron.train(new_inputs, p.label);
    if (guess == target) {
      fill(0,255,0);
    } else{
      fill(255,0,0);
    }
    noStroke();
    ellipse(p.pixelX(), p.pixelY(), 16, 16);
  }

}


void mousePressed(){
  for (Point p: points){
      float[] new_inputs = {p.x, p.y, p.bias};
      int target = p.label;
      perceptron.train(new_inputs, target);
}
}
