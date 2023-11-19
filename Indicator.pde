class Indicator
{
  float x, y, d, val;
  
  String name;
  char mode;
  char ch = 'a';
  
  boolean st;
  
  Indicator(String n, float _x, float _y, float _d, char m)
  {
    this.name = n;
    this.x = _x;
    this.y = _y;
    this.d = _d;
    this.mode = m;
  }
    
  
  void show()
  {
    translate(this.x, this.y);
    
    stroke(255);
    textSize(this.d);

    if(mode == 'l')
    {      
      if(st)
        fill(51, 204, 51);
      else
        fill(255, 51, 0);
      
      ellipse(0, 0, this.d, this.d);
      
      text(name, this.d,  this.d / 2.5);
    }
    else
    {
      fill(0, 153, 204);
      
      if(mode == 'v')
        text(name + val, -this.d / 2,  this.d / 2.5);
      else if(mode == 'c')
        text(name + ch, -this.d / 2,  this.d / 2.5);
      else if(mode == 'i')
        text(name + int(val), -this.d / 2,  this.d / 2.5);

      
    }
    
    translate(-this.x, -this.y);
  }
  
  
  
}
