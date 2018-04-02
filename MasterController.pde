import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;

float u=0;
float l=0;
float r=0;
 
Robot robot;

void setup() {
  size(1080,720);
  fill(0, 255, 0);
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  try { 
    robot = new Robot();
  } catch (AWTException e) {
    e.printStackTrace();
    exit();
  }
}

void draw() { 
  background(0);
  fill(0, 255, 0);
  
  if (r>0.5) {
    robot.keyPress(KeyEvent.VK_D);
  }
  else {
    robot.keyRelease(KeyEvent.VK_D);
  }
  
  if (l>0.5) {
    robot.keyPress(KeyEvent.VK_A);
  }
  else {
    robot.keyRelease(KeyEvent.VK_A);
  }
  
  if (u>0.5) {
    robot.keyPress(KeyEvent.VK_W);
  }
  else {
    robot.keyRelease(KeyEvent.VK_W);
  }
  
}

void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("fff")) { //Now looking for 3 parameters
        u = theOscMessage.get(0).floatValue(); //get this parameter
        l = theOscMessage.get(1).floatValue();
        r = theOscMessage.get(2).floatValue();
        println("Received new params value from Wekinator");
      } else {
        println("Error: unexpected params type tag received by Processing");
      }
 }
}
