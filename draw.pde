void drawInterface()
{
  background(220);
  
  updateValues();
  
  drawGapLines();

  drawConsoles();
  drawGyro();
  drawIndc();
  drawButtons();
  
  input.show();
}
  
  

void drawConsoles()
{
  RXcon.show();
  TXcon.show();
}
  


void drawGyro()
{
  xAxis.show();
  yAxis.show();
}
  
  
  
void drawIndc()
{
  serConI.show();
  RFconI.show();
  trnsI.show();
  dataI.show();
  batLvlI.show();
  chI.show();
}



void drawButtons()
{
  serConB.show();
  trnsB.show();
  tstConB.show(); 
  setDelB.show(); 
  chChB.show();
  
  dataMB.show();
  lisAirMB.show();
  pipeMB.show();  
}



void drawGapLines()
{
  strokeWeight(2);
  stroke(103, 193, 29);
  
  line(width * 0.175, 0, width * 0.175, height * 0.39);//at the rigth of the indicators
  
  line(0, height * 0.255, width * 0.175, height * 0.255);//upped data
    
  line(0, height * 0.39, width * 0.49, height * 0.39);//upper console
  
  line(0, height * 0.484, width * 0.49, height * 0.484);//under console

  line(width * 0.49, height * 0.39, width * 0.49, height * 0.484); //at the right of the console
  
  line(width * 0.38, 0 , width * 0.38, height * 0.39); //at the right of the buttons
  
  
  
  
}
