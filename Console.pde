class Console
{
  float x, y, w, h, strH;
  int bias, strN = 1;
  
  boolean as = true, choosen = false, f = false;
  String name;
  
  ArrayList<String> strings = new ArrayList<String>();
  
  
  Console(String n, float _x, float _y, float _w, float _h)
  {
    this.name = n;
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
        
    while((this.h - 10) / this.strN > 25)
      this.strN++;
    
    this.strH = (this.h - 20) / this.strN;
    
    if(this.strH < 20)
    {
      this.strN--;
      this.strH = (this.h - 20) / this.strN;
    }    
  }
  
  
 
  void show()
  {
    translate(this.x, this.y);
    
    stroke(170);
    strokeWeight(1);
    
    fill(0, 204, 102);
    rect(0, 0, w, 20);
    
    fill(30);
    textSize(15);
    text(name, 5, 16.5); 
    
    int d = 90;
    int s = 0;
    
    if(f)
      fill(145, 21, 114);
    else
      fill(216, 32, 170);
      
    ellipse(w - 10, 10, 15, 15);
    
    if(f)
    {
      strings.clear();
      f = false;
    }
    
    
    
    if(as)
      bias = strings.size();
    
    s = bias;
  
    for(int i = this.strN - 1; i >= 0 ; i--)
    {
      fill(d);
      rect(0, 20 + this.strH * i, this.w, this.strH);
      
      if(d == 90)
        d = 120;
      else
        d = 90;
        
      if(s > 0)
      {
        fill(230);
        text(strings.get(s - 1), 3, 17 + this.strH * (i + 1));
        s--;
      }
    }
    
    
    stroke(0);
    
    if(as)
      noFill();
    else
      fill(255, 255, 0);
      
    ellipse(w - 30, 10, 15, 15);
    
    
    if(choosen)
    {
      stroke(255, 153, 0);
      strokeWeight(2);
      noFill();
      rect(1, 1, this.w - 2, this.h - 1);
    }
 
    translate(-this.x, -this.y);
  }

}



void consoleSens()
{
  if(mouseX < width / 2 - 10 && mouseY > height / 2 + 20)
  {
    RXcon.choosen = !RXcon.choosen;
    
    if(!RXcon.choosen)
      RXcon.as = true;
    else
    {
      TXcon.choosen = false;
      TXcon.as = true;
      
      input.choosen = false;
    }
  }
    
  if(mouseY > height / 2 && mouseY < height / 2 + 20) //buttons
  {
    if(dist(mouseX, mouseY, RXcon.w - 30, RXcon.y + 10) < 8)
      RXcon.as = !RXcon.as;
      
    else if(dist(mouseX, mouseY, RXcon.w - 10, RXcon.y + 10) < 8)
      RXcon.f = true;
  }

  if(mouseX > width / 2 + 10 && mouseY > height / 2 + 20)
  {
    TXcon.choosen = !TXcon.choosen;
    
    if(!TXcon.choosen)
      TXcon.as = true;
    else
    {
      RXcon.choosen = false;
      RXcon.as = true;
      
      input.choosen = false;
    }
  }

  if(mouseY > height / 2 && mouseY < height / 2 + 20) //buttons
  {
    if(dist(mouseX, mouseY, TXcon.x + TXcon.w - 30, RXcon.y + 10) < 8)
      TXcon.as = !TXcon.as;
      
    else if(dist(mouseX, mouseY, TXcon.x + RXcon.w - 10, RXcon.y + 10) < 8)
      TXcon.f = true;
  }
}


void scrollConsole(float e)
{  
  if(RXcon.choosen && mouseX < width / 2 - 10 && mouseY > height / 2 + 20)
  {
    RXcon.as = false;
    
    if(RXcon.bias + e >= RXcon.strN && RXcon.bias + e <= RXcon.strings.size())
      RXcon.bias += e;
  }
  
  if(TXcon.choosen && mouseX > width / 2 + 10 && mouseY > height / 2 + 20)
  {
    TXcon.as = false;
    
    if(TXcon.bias + e >= TXcon.strN && TXcon.bias + e <= TXcon.strings.size())
      TXcon.bias += e;
  }  
}
