void updateValues()
{
  serConI.st = serialCon;
  RFconI.st = RFcon;
  trnsI.st = trns;
  dataI.st = newData;
  
  chooseMode();
}



void sortData()
{
  if(newData)
  {    
    if(serialData.contains("RX : "))
    {
      RXcon.strings.add(serialData.substring(5));
    }
    else if(serialData.contains("TX : "))
    {
      println("TX say : ", serialData);
      TXcon.strings.add(serialData.substring(5));
    }
    else
    {
      println("Data : ", serialData);
    }
    
    newData = false;
  }
}



int b_pshd = 0;

void chooseMode()
{
  if(modeChanged)
  {    
    dataMB.st = false;
    lisAirMB.st = false;
    pipeMB.st = false;
    
    if(b_pshd == 1)
    {
      dataMB.st = true;
      
      if(serialCon)
      {
        if(mode == 'p')
          myPort.write('#');
          
        myPort.write("$d");
      }
      
      mode = 'd';
    }
      
    else if(b_pshd == 2)
    {
      lisAirMB.st = true;
      
      if(serialCon)
      {
        if(mode == 'p')
          myPort.write('#');
          
        myPort.write("$l");      
        
        checkSerial(true);
      }
      mode = 'l';

    }
      
    else if(b_pshd == 3)
    {
      pipeMB.st = true;
      
      if(serialCon)
        myPort.write("$p");
    
      mode = 'p';
    }
    
    modeChanged = false;
  }
}



void readButtons()
{
  if(serConB.st && !serialCon) 
    serialCon = openPort();
  
  if(serialCon && serConT != 0 && millis() - serConT > 3000)
  {
    serConT = 0;
    modeChanged = true;
  }    
 
  else if(!serConB.st && serialCon)
  {
    serialCon = closePort();
    RFcon = false;
    trns = false;
  }
     
  
  if(trnsB.st && !trns)
  {
    if(serialCon && RFcon)
    {
      myPort.write("$$s");
      trns = true;
      println("Transmission started");
    }
    else
      trnsB.st = false;
  }
  else if(!trnsB.st && trns)
  {
    myPort.write("$$z");
    trns = false;
    println("Transmission stopped");
  }

  
  if(tstConB.st)
  {
    if(serialCon)
      RFcon = testRFcon();
    else
      RFcon = false;
      
    tstConB.st = false;
  }
  
  if(setDelB.st)
  {
    if(!input.data.isEmpty() && serialCon && RFcon && mode == 'd')
    {
      myPort.write("$$d" + input.data);
      println("Setting delay : ", input.data);
      input.data = "";
    }
    
    setDelB.st = false;
  }
  
  if(chChB.st)
  {
    if(!input.data.isEmpty() && serialCon && RFcon && mode == 'd')
    {
      myPort.write("$$c" + input.data);
      println("Channel changing to ", input.data);
      input.data = "";
    }
    
    chChB.st = false;
  }
  
  
  
  if(dataMB.st && mode != 'd')
  {
    b_pshd = 1;
    modeChanged = true;
  }
    
  else if(lisAirMB.st && mode != 'l')
  {   
    b_pshd = 2;
    modeChanged = true;
  }
    
  else if(pipeMB.st && mode != 'p')
  {
    b_pshd = 3;
    modeChanged = true;
  }
  
    
    
}
