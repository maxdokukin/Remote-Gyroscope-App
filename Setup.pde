void setPositions()
{
  RXcon = new Console("RX", 0, height / 2, width / 2 - 10, height / 2);
  TXcon = new Console("TX", width / 2 + 10, height / 2, width / 2 - 11, height / 2);
  
  xAxis = new Axis('X', width * 0.65, height * 0.325, height / 4);
  yAxis = new Axis('Y', width * 0.9, height * 0.325, height / 4);
  
  serConI = new Indicator("Serial", width * 0.015, height * 0.03, width / 60, 'l');
  RFconI = new Indicator("RF connection", width * 0.015, height * 0.06, width / 60, 'l');
  trnsI = new Indicator("Transmission", width * 0.015, height * 0.09, width / 60, 'l');
  dataI = new Indicator("New data", width * 0.015, height * 0.12, width / 60, 'l');
  
  batLvlI = new Indicator("Battery V : ", width * 0.015, height * 0.19, width / 60, 'v');
  chI = new Indicator("Channel :  ", width * 0.015, height * 0.22, width / 60, 'i');
  
  serConB = new Button("Serial", width * 0.2, height * 0.015, height * 0.05, 'r');
  trnsB = new Button("Transmission", width * 0.2, height * 0.085, height * 0.05, 'r');
  tstConB = new Button("Test Connection", width * 0.2, height * 0.155, height * 0.05, 'b');
  setDelB = new Button("Set delay", width * 0.2, height * 0.225, height * 0.05, 'b');
  chChB = new Button("Change channel", width * 0.2, height * 0.295, height * 0.05, 'b');
  
  dataMB = new Button("Data", width * 0.023, height * 0.295, height * 0.05, 'm');
  lisAirMB = new Button("Listen Air", width * 0.073, height * 0.295, height * 0.05, 'w');
  pipeMB = new Button("Pipe", width * 0.123, height * 0.295, height * 0.05, 'm');

  input = new Input("Console", width * 0.2, height * 0.4, width * 0.25, height * 0.07);
}
