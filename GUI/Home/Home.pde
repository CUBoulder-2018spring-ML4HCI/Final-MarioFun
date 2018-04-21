import controlP5.*;

ControlP5 gui;

void setup(){
//set the window size
size(600,600);
noStroke();
//Create the new GUI
gui = new ControlP5(this);
//Add a Button
gui.addButton("Start")
   //Set the position of the button : (X,Y)
   .setPosition(175,200)
   //Set the size of the button : (X,Y)
   .setSize(100,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(0)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.RELEASE);
   ;

gui.addButton("Train")
   //Set the position of the button : (X,Y)
   .setPosition(325,200)
   //Set the size of the button : (X,Y)
   .setSize(100,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(0)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.RELEASE);
   ;

gui.addButton("View Memory")
   //Set the position of the button : (X,Y)
   .setPosition(175,350)
   //Set the size of the button : (X,Y)
   .setSize(100,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(0)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.RELEASE);
   ;
   
gui.addButton("About")
   //Set the position of the button : (X,Y)
   .setPosition(325,350)
   //Set the size of the button : (X,Y)
   .setSize(100,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(0)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.RELEASE);
   ;
}

public void PressMe(int value){
// This is the place for the code, that is activated by the buttonb
println("Button pressed");
}

public void controlEvent(ControlEvent theEvent) {
//Is called whenever a GUI Event happened
}

void draw(){
//Do whatever you want
}