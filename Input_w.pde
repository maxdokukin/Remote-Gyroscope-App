class Input
{
  float x, y, w, h;
  
  int val;
  
  long ot;
  
  boolean choosen, crs, send;
  
  String name, data = new String();
    
  Input(String n, float _x, float _y, float _w, float _h)
  {
    this.name = n;
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h; 
  }
  
  
  
  void update()
  {
    if(this.choosen && millis() - ot > 500)
    {
      this.crs = !this.crs;
      
      ot = millis();
    } 
    
    if(send)
    {
      this.data = "";
      this.send = false;
    }
  }
  
  
  void show()
  {
    translate(this.x, this.y);
    
    this.update();
    
    fill(90);
    textSize(this.h - 4);
    text(data, this.w * 0.025, this.h * 0.83);
    
    text(name, -textWidth(name) - width * 0.02, this.h * 0.83);
    
    strokeWeight(2);
    noFill();
    
    if(choosen)
      stroke(255, 153, 0);
    else
    {
      stroke(90);
      crs = false;
    }
    
    rect(0, 0, this.w, this.h);

    
    if(crs)
    {
      strokeWeight(this.w * 0.01);
      stroke(170);
      
      float lx = this.w * 0.04 + textWidth(this.data);
    
      line(lx, this.h * 0.9, lx, this.h * 0.1);
    }
    
    translate(-this.x, -this.y);
  }

}



void inputSens()
{
  if(mouseX > width * 0.2 && mouseY > height * 0.393 && mouseX <  width * 0.4 && mouseY < height * 0.463)
  {
    input.choosen = !input.choosen;
    
    if(RXcon.choosen)
      RXcon.as = true;

    RXcon.choosen = false;
    
    if(TXcon.choosen)
      TXcon.as = true;
    
    TXcon.choosen = false;
  }
}



void inputKeyCheck()
{
  if(input.choosen)
    if(keyCode == 10 && serialCon)
    {
      myPort.write(input.data);
      println("Sent : ", input.data);
      input.send = true;
    }
      
    else if(keyCode == 8 && input.data.length() > 0)
      input.data = input.data.substring(0, input.data.length() - 1);
      
    else if(textWidth(input.data + key) + input.w * 0.04  < input.w && keyCode != 8 && keyCode != 10 && keyCode != 16 && keyCode != 17 && keyCode != 18)
      input.data += key;
    
}
