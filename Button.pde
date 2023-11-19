class Button
{
  float x,  y,  h;
  
  boolean st;
  
  String name;
  
  char mode;
  
  Button(String n, float _x, float _y, float _h, char m)
  {
    this.name = n;
    this.x = _x;
    this.y = _y;
    this.h = _h;
    this.mode = m;
  }
  


  void show()
  {
    translate(this.x, this.y);
    
    stroke(0);
    textSize(width / 60);
    
    fill(0, 204, 102);
    rect(0, 0, this.h, this.h);    
    
    if(mode == 'r')
      if(st)
        fill(51, 204, 51);
      else
        fill(255, 51, 0);

    else if(mode == 'b')
      if(st)
        fill(32, 216, 176);
      else
        fill(148, 167, 242);        
        
    else if(mode == 'm' || mode == 'w')
      if(st)
        fill(147, 79, 22);
      else
        fill(249, 155, 77);   
        
    rect(h * 0.1, h * 0.1, this.h * 0.8, this.h * 0.8);
    
    if(st)
      fill(80);
    else
      fill(100);
    
    if(mode == 'r' || mode == 'b')
      text(name, this.h + 5, this.h * 0.75);
    else if(mode == 'm')
      text(name,  (this.h - textWidth(name)) / 2, -this.h * 0.25);    
    else if(mode == 'w')
      text(name, (this.h - textWidth(name)) / 2, this.h + width / 60 + this.h * 0.1);
    
    translate(-this.x, -this.y);
  }
}


void buttonSens()
{
  if(mouseX > width * 0.2 && mouseX < width * 0.2 + height * 0.05)
  {
    if(mouseY > 0.025 * height && mouseY < 0.063 * height)
      serConB.st = !serConB.st;
    
    if(mouseY > 0.095 * height && mouseY < 0.133 * height)
      trnsB.st = !trnsB.st;
    
    if(mouseY > 0.166 * height && mouseY < 0.203 * height)
      tstConB.st = !tstConB.st;
      
    if(mouseY > 0.235 * height && mouseY < 0.273 * height)
      setDelB.st = !setDelB.st;
      
    if(mouseY > 0.305 * height && mouseY < 0.345 * height)
      chChB.st = !chChB.st;
  }
    
  if(mouseY > height * 0.306 && mouseY < height * 0.343)
  {
    if(mouseX >= 0.034 * width && mouseX <= 0.035 * width + height * 0.04)
      dataMB.st = !dataMB.st;    
      
    if(mouseX >= 0.084 * width && mouseX <= 0.084 * width + height * 0.04)
      lisAirMB.st = !lisAirMB.st;    
      
    if(mouseX >= 0.134 * width && mouseX <= 0.134 * width + height * 0.04)
      pipeMB.st = !pipeMB.st;    
  }
}
