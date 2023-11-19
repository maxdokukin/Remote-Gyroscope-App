boolean testRFcon()
{/*  
  myPort.write("$tr");
  
  long t = millis();
  
  while(millis() - t < 500)
    if(myPort.available() > 1 && myPort.read() == '$')
      if(myPort.read() == 'o')
        return true;
      */
  return true;///CHANGE TO FALSE!!!
}


void getMode()
{
  myPort.write("$im");
  
  long t = millis();
  
  while(millis() - t < 500)
  {
    if(myPort.available() > 2)
      if(myPort.read() == '$')
        if(myPort.read() == 'm')
        {
          mode = myPort.readChar();
          println("New mode : ", mode);
        }
  }
  println("timeout");
  
  
}
