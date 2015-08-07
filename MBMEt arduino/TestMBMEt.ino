
int green1 = 11;
int blue1 =9;
int blue2 = 7;
int green2 =3;



const int button1 = 12;
const int button2 = 10;
const int button3 = 8;
const int button4 = 4;

int inByte;


void setup() {
 pinMode(blue1, OUTPUT);
 pinMode(green1, OUTPUT);
 pinMode(blue2, OUTPUT);
  pinMode(green2, OUTPUT);
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);
  pinMode(button3, INPUT);
  pinMode(button4, INPUT);
  Serial.begin(9600);
  establishContact();
}

void loop () {



  if (Serial.available()){
    inByte = Serial.read();

    int sensorValue = digitalRead(button1);
    Serial.print(sensorValue);
    Serial.print(',');
    sensorValue = digitalRead(button2);
    Serial.print(sensorValue);
    Serial.print(',');
    sensorValue= digitalRead(button3);
    Serial.print(sensorValue);
    Serial.print(',');
    sensorValue = digitalRead(button4);
    Serial.print(sensorValue);
    Serial.println(" ");
  }


//  _______________TURN LEDS ON______________

  if (digitalRead(button1) == HIGH) {
    digitalWrite(green1, HIGH);
  }
  else {
    digitalWrite(green1, LOW);
   }
  
  if (digitalRead(button2) == HIGH) {
    digitalWrite(blue1, HIGH);
  }
   else {
    digitalWrite(blue1, LOW);
   }
  
  
  if (digitalRead(button3) == HIGH) {
    digitalWrite(blue2, HIGH);  
  }
   else {
    digitalWrite(blue2, LOW);
   }
   
   
  if (digitalRead(button4) == HIGH) {
   digitalWrite(green2, HIGH);
  }
   else {
    digitalWrite(green2, LOW);
   }
 
}

  void establishContact(){
 while(Serial.available() <=0){
    Serial.println("begin");
    delay(10);
  
  }
}


