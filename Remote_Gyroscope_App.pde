import processing.serial.*;

Serial myPort;

Console RXcon, TXcon; 
Axis xAxis, yAxis;
Indicator serConI, RFconI, trnsI, dataI, batLvlI, chI;
Button serConB, trnsB, tstConB, setDelB, chChB, dataMB, lisAirMB, pipeMB;
Input input;

String serialData = new String();

boolean serialCon, RFcon, trns, newData, modeChanged, dataInSerial;

long serConT = 0;

char mode = 'n';

void setup()
{
  size(1000, 600);
  frameRate(30);

  setPositions();
}



void draw()
{  
  drawInterface();
  
  readButtons();
  
  sortData();
  
  checkSerial(false);

}

void keyPressed()
{
  inputKeyCheck();
}

void mousePressed()
{
  consoleSens();
  
  buttonSens();
  
  inputSens();
}

void mouseWheel(MouseEvent event) 
{
  scrollConsole(event.getCount());
}

void serialEvent(Serial p)
{
  dataInSerial = true;
}
