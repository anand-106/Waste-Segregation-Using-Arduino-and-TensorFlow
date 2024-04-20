#include <Servo.h>

// Define the pin for the LED
const int ledPin = 13;
const int trigPin = 9;
const int echoPin = 10;
Servo s1;

void setup() {
  // Initialize serial communication
  Serial.begin(9600);
  s1.attach(12);
  s1.write(85);
  // Set the LED pin as an output
  pinMode(ledPin, OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  // Measure distance
  long duration, distance;
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2;

  // Check if data is available to read from serial port
  if (Serial.available() > 0) {
    // Read the incoming byte
    char receivedChar = Serial.read();

    // Check if the received data is '1'
    if (receivedChar == '1') {
      // Turn on the LED
      digitalWrite(ledPin, HIGH);
      s1.write(1);
      delay(1000);
      digitalWrite(ledPin, LOW);
      s1.write(85);
      
      
    }
    // Check if the received data is '0'
    else if (receivedChar == '0') {
      // Turn off the LED
      digitalWrite(ledPin, HIGH);
      s1.write(175);
      delay(1000);
      digitalWrite(ledPin, LOW);
      s1.write(85);
     
    }
  }
  
  // Send the distance value to the serial port
   // Delay for stability
   
      Serial.println(distance);
      delay(1000);
    }

