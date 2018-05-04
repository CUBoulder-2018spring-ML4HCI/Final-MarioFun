import controlP5.*;

import java.awt.*;
import java.io.*;
import oscP5.*;
import netP5.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;

Robot robot;
OscP5 oscP5c;
NetAddress destc;
OscP5 oscP5;
NetAddress dest;
ControlP5 cp5;

int myColor = color(255);
float[] oscrec= new float[100];
int c1,c2;
int getsize;
float n,n1;
String lastInput = new String();
String currentInput = new String();
int t=0;
String[] robarr = new String[100];
void setup() {
  oscP5c = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  destc = new NetAddress("127.0.0.1",6448);
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);
  OscMessage msg = new OscMessage("/wekinator/control/setInputNames");
  msg.add("X");
  msg.add("Y");
  msg.add("Z");
  oscP5.send(msg, dest);
  size(400,600);
  noStroke();
  try { 
    robot = new Robot();
  } catch (AWTException e) {
    e.printStackTrace();
    exit();
  }
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
  cp5.addButton("Controller Set Up")
     .setBroadcast(false)
     .setValue(128)
     .setPosition(200,500)
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
  int w=0;
  int z=0;
  String[] arr=Submit();
  int p=70;
  while (w<arr.length){
    if (oscrec[w]>0.5){
      p=w;
      z++;
    }
    w++;
  }
  if (p!=70){
  if (robarr[p]=="A"){robot.keyPress(KeyEvent.VK_A);}
  else {robot.keyRelease(KeyEvent.VK_A);}
  
  if (robarr[p]=="B"){robot.keyPress(KeyEvent.VK_B);}
  else {robot.keyRelease(KeyEvent.VK_B);}
  
  if (robarr[p]=="C"){robot.keyPress(KeyEvent.VK_C);}
  else {robot.keyRelease(KeyEvent.VK_C);}
  
  if (robarr[p]=="D"){robot.keyPress(KeyEvent.VK_D);}
  else {robot.keyRelease(KeyEvent.VK_D);}
  
  if (robarr[p]=="E"){robot.keyPress(KeyEvent.VK_E);}
  else {robot.keyRelease(KeyEvent.VK_E);}
  
  if (robarr[p]=="F"){robot.keyPress(KeyEvent.VK_F);}
  else {robot.keyRelease(KeyEvent.VK_F);}
  
  if (robarr[p]=="G"){robot.keyPress(KeyEvent.VK_G);}
  else {robot.keyRelease(KeyEvent.VK_G);}
  
  if (robarr[p]=="H"){robot.keyPress(KeyEvent.VK_H);}
  else {robot.keyRelease(KeyEvent.VK_H);}
  
  if (robarr[p]=="I"){robot.keyPress(KeyEvent.VK_I);}
  else {robot.keyRelease(KeyEvent.VK_I);}
  
  if (robarr[p]=="J"){robot.keyPress(KeyEvent.VK_J);}
  else {robot.keyRelease(KeyEvent.VK_J);}
  
  if (robarr[p]=="K"){robot.keyPress(KeyEvent.VK_K);}
  else {robot.keyRelease(KeyEvent.VK_K);}
  
  if (robarr[p]=="L"){robot.keyPress(KeyEvent.VK_L);}
  else {robot.keyRelease(KeyEvent.VK_L);}
  
  if (robarr[p]=="M"){robot.keyPress(KeyEvent.VK_M);}
  else {robot.keyRelease(KeyEvent.VK_M);}
  
  if (robarr[p]=="N"){robot.keyPress(KeyEvent.VK_N);}
  else {robot.keyRelease(KeyEvent.VK_N);}
  
  if (robarr[p]=="O"){robot.keyPress(KeyEvent.VK_O);}
  else {robot.keyRelease(KeyEvent.VK_O);}
  
  if (robarr[p]=="P"){robot.keyPress(KeyEvent.VK_P);}
  else {robot.keyRelease(KeyEvent.VK_P);}
  
  if (robarr[p]=="Q"){robot.keyPress(KeyEvent.VK_Q);}
  else {robot.keyRelease(KeyEvent.VK_Q);}
  
  if (robarr[p]=="R"){robot.keyPress(KeyEvent.VK_R);}
  else {robot.keyRelease(KeyEvent.VK_R);}
  
  if (robarr[p]=="S"){robot.keyPress(KeyEvent.VK_S);}
  else {robot.keyRelease(KeyEvent.VK_S);}
  
  if (robarr[p]=="T"){robot.keyPress(KeyEvent.VK_T);}
  else {robot.keyRelease(KeyEvent.VK_T);}
  
  if (robarr[p]=="U"){robot.keyPress(KeyEvent.VK_U);}
  else {robot.keyRelease(KeyEvent.VK_U);}
  
  if (robarr[p]=="V"){robot.keyPress(KeyEvent.VK_V);}
  else {robot.keyRelease(KeyEvent.VK_V);}
  
  if (robarr[p]=="W"){robot.keyPress(KeyEvent.VK_W);}
  else {robot.keyRelease(KeyEvent.VK_W);}
  
  if (robarr[p]=="X"){robot.keyPress(KeyEvent.VK_X);}
  else {robot.keyRelease(KeyEvent.VK_X);}
  
  if (robarr[p]=="Y"){robot.keyPress(KeyEvent.VK_Y);}
  else {robot.keyRelease(KeyEvent.VK_Y);}

  if (robarr[p]=="Z"){robot.keyPress(KeyEvent.VK_Z);}
  else {robot.keyRelease(KeyEvent.VK_Z);}
  
  if (robarr[p]=="UP"){robot.keyPress(KeyEvent.VK_UP);}
  else {robot.keyRelease(KeyEvent.VK_UP);}
  
  if (robarr[p]=="DOWN"){robot.keyPress(KeyEvent.VK_DOWN);}
  else {robot.keyRelease(KeyEvent.VK_DOWN);}
  
  if (robarr[p]=="RIGHT"){robot.keyPress(KeyEvent.VK_RIGHT);}
  else {robot.keyRelease(KeyEvent.VK_RIGHT);}
  
  if (robarr[p]=="LEFT"){robot.keyPress(KeyEvent.VK_LEFT);}
  else {robot.keyRelease(KeyEvent.VK_LEFT);}
  
  if (robarr[p]=="SHIFT"){robot.keyPress(KeyEvent.VK_SHIFT);}
  else {robot.keyRelease(KeyEvent.VK_SHIFT);}
  
  if (robarr[p]=="CONTROL"){robot.keyPress(KeyEvent.VK_CONTROL);}
  else {robot.keyRelease(KeyEvent.VK_CONTROL);}
  
  if (robarr[p]=="RETURN"){robot.keyPress(KeyEvent.VK_ENTER);}
  else {robot.keyRelease(KeyEvent.VK_ENTER);}
  
  if (robarr[p]=="SPACE"){robot.keyPress(KeyEvent.VK_SPACE);}
  else {robot.keyRelease(KeyEvent.VK_SPACE);}
  
}
  
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
if (theEvent.getController().getName() == "Controller Set Up"){
    String[] arr=Submit();
      println("Enter a key to map with: ",arr[t]);
      delay(1000);
      if (keyPressed == true){
        if (key=='a' || key=='A'){robarr[t]="A";}
        if (key=='b' || key=='B'){robarr[t]="B";}
        if (key=='c' || key=='C'){robarr[t]="C";}
        if (key=='d' || key=='D'){robarr[t]="D";}
        if (key=='e' || key=='E'){robarr[t]="E";}
        if (key=='f' || key=='F'){robarr[t]="F";}
        if (key=='g' || key=='G'){robarr[t]="G";}
        if (key=='h' || key=='H'){robarr[t]="H";}
        if (key=='i' || key=='I'){robarr[t]="I";}
        if (key=='j' || key=='J'){robarr[t]="J";}
        if (key=='k' || key=='K'){robarr[t]="K";}
        if (key=='l' || key=='L'){robarr[t]="L";}
        if (key=='m' || key=='M'){robarr[t]="M";}
        if (key=='n' || key=='N'){robarr[t]="N";}
        if (key=='o' || key=='O'){robarr[t]="O";}
        if (key=='p' || key=='P'){robarr[t]="P";}
        if (key=='q' || key=='Q'){robarr[t]="Q";}
        if (key=='r' || key=='R'){robarr[t]="R";}
        if (key=='s' || key=='S'){robarr[t]="S";}
        if (key=='t' || key=='T'){robarr[t]="T";}
        if (key=='u' || key=='U'){robarr[t]="U";}
        if (key=='v' || key=='V'){robarr[t]="V";}
        if (key=='w' || key=='W'){robarr[t]="W";}
        if (key=='x' || key=='X'){robarr[t]="X";}
        if (key=='y' || key=='Y'){robarr[t]="Y";}
        if (key=='z' || key=='Z'){robarr[t]="Z";}
        if (keyCode==UP){robarr[t]="UP";}
        if (keyCode==DOWN){robarr[t]="DOWN";}
        if (keyCode==RIGHT){robarr[t]="RIGHT";}
        if (keyCode==LEFT){robarr[t]="LEFT";}
        if (keyCode==SHIFT){robarr[t]="SHIFT";}
        if (keyCode==CONTROL){robarr[t]="CONTROL";}
        if (keyCode==RETURN){robarr[t]="RETURN";}
        if (key==' '){robarr[t]="SPACE";}
        println(robarr[t],t);
        
      t++;
    }
    if (t>=arr.length){t=0;}
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

void oscEvent(OscMessage theOscMessage) {
 int x=0;
 String[] arr=Submit();
 oscrec= new float[100];
  if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
    while(x<arr.length){
    oscrec[x] = theOscMessage.get(x).floatValue(); //get this parameter
        x++;
    }
 }
}
