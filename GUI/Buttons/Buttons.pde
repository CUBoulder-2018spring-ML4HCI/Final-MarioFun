import controlP5.*;

ControlP5 gui;

void setup(){
size(600,600);
noStroke();

//Create new GUI
gui = new ControlP5(this);

//Adding a Button
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
   .setPosition(325,200)
   .setSize(100,100)
   .setValue(0)
   .activateBy(ControlP5.RELEASE);
   ;

gui.addButton("View Memory")
   .setPosition(175,350)
   .setSize(100,100)
   .setValue(0)
   .activateBy(ControlP5.RELEASE);
   ;
   
gui.addButton("About")
   .setPosition(325,350)
   .setSize(100,100)
   .setValue(0)
   .activateBy(ControlP5.RELEASE);
   ;
}

public void PressMe(int value){
//Button press scripts 
println("Button pressed");
}

public void controlEvent(ControlEvent theEvent) {
//Is called whenever a GUI Event happened
}

void draw(){
//KMS
}