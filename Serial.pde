boolean openPort()
{  
  printArray(Serial.list());
    
  for(byte portN = 0; portN < Serial.list().length; portN++)
    if(Serial.list()[portN].equals("/dev/cu.wchusbserial1420"))// || Serial.list()[portN].equals("/dev/cu.wchusbserial1410"))
    {
      print("Opening port");

      byte tries = 0;
      
      while(tries < 5)
      {
        print('.');
        try
        {
          myPort = new Serial(this, Serial.list()[portN], 9600);        
        }
        catch(Exception e)
        {
          tries++;
          continue;
        }
        break;
      }
      
      if(tries < 5)
        println('\n', Serial.list()[portN], "port opened!\nReading data...");
      else
      {
        println("Can't open port");
        return false;
      }      
      myPort.clear();
      serConT = millis();
      return true;
    }

    println("No such port");
    serConB.st = false;
      
  return false;
}



boolean closePort()
{
  myPort.stop();
  println("Port closed");
  return false;
}



void checkSerial(boolean f)
{
  if(mode != 'l' || f)
  {
    if(f)
      delay(30);
      
    delay(10);
    
    if(dataInSerial)
    {       
      if(myPort.available() > 1)
        serialData = "";
      else
      {
        myPort.read();
        return;
      }
      
      long t = millis();
      
      while(millis() - t < 100)
        if(myPort.available() > 0)
        {
          char c = myPort.readChar();
          
          if(c == 13)
          {
            t -= 50;
            break;
          }
          
          if(c != 10)
            serialData += c;
        }
        
      if(myPort.available() == 0)
          dataInSerial = false;
       
      newData = true;  
    }
  }
  else if(serialCon)
    while(myPort.available() > 0)
      print(myPort.readChar());
  
}
