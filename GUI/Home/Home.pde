import controlP5.*;

import java.awt.*;
import oscP5.*;
import netP5.*;
import java.io.*;

OscP5 oscP5;
NetAddress dest;
ControlP5 cp5;

int myColor = color(255);

int c1,c2;
int getsize;
float n,n1;
String lastInput = new String();
String currentInput = new String();

void setup() {
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);
  size(400,600);
  noStroke();
  cp5 = new ControlP5(this);

  //Declare, and define buttons
  cp5.addButton("Start")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(100,100)
     .setSize(200,19)
     .setBroadcast(true)
     .activateBy(ControlP5.RELEASE)
     ;
  
  //Adding more buttons
  cp5.addButton("Train")
     .setBroadcast(false)
     .setValue(100)
     .setPosition(100,120)
     .setSize(200,19)
     .setBroadcast(true)
     .activateBy(ControlP5.RELEASE)
     ;
     
  cp5.addButton("Memory")
     .setBroadcast(false)
     .setPosition(100,140)
     .setSize(200,19)
     .setValue(0)
     .setBroadcast(true)
     .activateBy(ControlP5.RELEASE)
     ;

  cp5.addButton("About")
     .setBroadcast(false)
     .setValue(128)
     .setPosition(130,400)
     .updateSize()
     .setBroadcast(true)
     .activateBy(ControlP5.RELEASE)
     ;
     
  cp5.addButton("Quit")
     .setBroadcast(false)
     .setValue(128)
     .setPosition(200,400)
     .updateSize()
     .setBroadcast(true)
     .activateBy(ControlP5.RELEASE)
     ;
     cp5.addTextfield("Controls").setPosition(20, 170).setSize(200, 40).setAutoClear(false);
     cp5.addBang("Submit").setPosition(240, 170).setSize(80, 40); 
}

String[] Submit(){
  String url1 = cp5.get(Textfield.class,"Controls").getText();
  String[] arr = split(url1, ',');
  int x=0;
  OscMessage msg = new OscMessage("/wekinator/control/setOutputNames");
  while (arr.length>x){
    getsize=arr.length;
    msg.add(arr[x]);
    x++;
  }
  oscP5.send(msg, dest);
  return arr;
}

int flag=0;
void draw() {
  background(myColor);
  myColor = lerpColor(c1,c2,n);
  n += (1-n)* 0.1; 
}
int q=0;
//Event Handler
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  if (theEvent.getController().getName() == "Quit"){
    exit();
    OscMessage msg = new OscMessage("/wekinator/control/stopRunning");
    oscP5.send(msg, dest);
}
  if (theEvent.getController().getName() == "Start"){
      OscMessage msg = new OscMessage("/wekinator/control/startRunning");
      oscP5.send(msg, dest);
    }
  if (theEvent.getController().getName() == "Train"){
    int x=0;
    String[] arr=Submit();
    float sender[]=new float[arr.length];
    while (arr.length>x){
      println("How do you want to control ",arr[x]," ?");
      println("hold position for 8 seconds.");
      delay(1000);
      OscMessage msg = new OscMessage("/wekinator/control/outputs");
      sender[x]=1;
      int y=0;
      while (arr.length>y){
      msg.add(sender[y]);
      y++;
      }
      sender[x]=0;
      oscP5.send(msg, dest);
      msg = new OscMessage("/wekinator/control/startRecording");
      oscP5.send(msg, dest);
      delay(5000);
      msg = new OscMessage("/wekinator/control/stopRecording");
      oscP5.send(msg, dest);
      x++;
    }
      OscMessage msg = new OscMessage("/wekinator/control/train");
      oscP5.send(msg, dest);
    }
  n = 0;
}

//Button events
public void Start(int theValue) {
  println("a button event from Start: "+theValue);
  c1 = c2;
  c2 = color(0,160,100);
}

public void Train(int theValue) {
  println("a button event from Train: "+theValue);
  c1 = c2;
  c2 = color(150,0,0);
}

public void Memory(int theValue) {
  println("a button event from Memory: "+theValue);
  c1 = c2;
  c2 = color(255,255,0);
}

public void About(int theValue) {
  println("a button event from About: "+theValue);
  c1 = c2;
  c2 = color(0,0,150);
}

public void Quit(int theValue) {
  println("a button event from Quit: "+theValue);
  c1 = c2;
  c2 = color(0,0,0);
}
