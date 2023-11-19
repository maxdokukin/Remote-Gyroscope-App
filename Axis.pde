class Axis
{
  float x, y, d, ang;
   
  char name;
  
  Axis(char n, float _x, float _y, float _d)
  {
    this.name = n;
    this.x = _x;
    this.y = _y;
    this.d = _d;
  }
  
  void angle(float a)
  {
    this.ang = a;
  }
  
  void show()
  {
    translate(this.x, this.y);
    
    stroke(0, 102, 0);
    strokeWeight(1);
    fill(0, 102, 0);
    line(-sin(radians(-ang + 90)) * d / 1.8, -cos(radians(-ang + 90)) * d / 1.8, sin(radians(-ang + 90)) * d / 1.8, cos(radians(-ang + 90)) * d / 1.8);
    ellipse(0, 0, 10, 10);
    
    strokeWeight(3);
    noFill();
    
    if(name == 'X')
      stroke(255, 51, 0);
    else if(name == 'Y')
      stroke(51, 153, 255);
          
    ellipse(0, 0, this.d, this.d);
    
    strokeWeight(1);
    textSize(this.d / 5);
    fill(100);
    
    text(name, -this.d / 15, -this.d / 1.8);
    
    text(int(ang), -this.d / 7, -this.d / 4);
    
    translate(-this.x, -this.y);
  }
  
  
}
