import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import processing.serial.*;

Serial myPort;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;

int nowPlaying1, nowPlaying2, nowPlaying3, nowPlaying4;
int volume = 1;

boolean firstContact = false;

void setup() {

  size(100,100, P3D); 

  //get values from arduino
  println(Serial.list());
  String portName = Serial.list()[9];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');

  //add songs 

  minim = new Minim(this);
  song1 = minim.loadFile("cello1.wav");
  song2 = minim.loadFile("cello2.wav");
  song3 = minim.loadFile("viola1.wav");
  song4 = minim.loadFile("viola2.wav");
  
  
  song1.play();
  song1.loop();
  song2.play();
  song2.loop();
  song3.play();
  song3.loop();
  song4.play();
  song4.loop();
 
  
}

void draw() {
  
  // connect songs to each sensor. You can change the valuyes based on the state of the pressure sensor
  if (nowPlaying1 == 0 ) {
    song1.mute();
    
   }
   else { 
     song1.unmute();
   }
   
   if (nowPlaying2 == 0) {
    song2.mute();
   }
   else {
     song2.unmute();
     
   }
   if (nowPlaying3 == 0) {
    song3.mute();
   }
   else {
     song3.unmute();
   }
   if (nowPlaying4 == 0) {
    song4.mute();
    
   }
   else { 
     song4.unmute();
    
   }
}

void serialEvent(Serial myPort) {
  String myString = myPort.readStringUntil('\n');
  //String [] numbers = split(myString, ',');
  if (myString != null) {
    myString = trim(myString);

    int sensors[] = int(split(myString, ','));
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    println();

    if (sensors.length==4) {
      nowPlaying1 = sensors[0];
       nowPlaying2 = sensors[1];
        nowPlaying3 = sensors[2];
         nowPlaying4 = sensors[3];
        
    }
     
  }
  myPort.write('A');
}
  
