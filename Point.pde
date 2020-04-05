float f(float x){
  return 0.5 * x - 0.4;

}

class Point{
  float x;
  float y;
  int label;
  float bias = 1;
  
  Point(float x_, float y_){  
    x = x_;
    y = y_;
    
  }  
  
  
  Point(){
    x = random(-1,1);
    y = random(-1,1);
    
    float lineY = f(x);
    if (y > lineY){
      label = 1;
    }
    else {
      label = -1;
    }
  }
  
  
  float pixelX(){
    return map(x, -1, 1, 0, width);
  }
  
  float pixelY(){
    return map(y, -1, 1, height, 0);
  }
  void show(){
    stroke(0);
    if (label == 1){
      fill(255);
    }
    else{
      fill(0);
    }
    
    float px = pixelX();
    float py = pixelY();
    ellipse(px,py,32,32);
  }

}
