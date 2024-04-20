# Smart Dustbin Project

## Overview
This repository contains the source code for a Smart Dustbin project that utilizes computer vision, machine learning, and IoT technologies to automatically segregate waste into biodegradable and non-biodegradable categories. The project involves two main components: 

1. **Object Detection and Classification:** A computer with a camera captures live video of the waste being disposed of. The video feed is processed using TensorFlow to detect and classify objects as either biodegradable or non-biodegradable. 

2. **IoT Integration:** An ultrasonic sensor is installed inside the dustbin to monitor the fill level in real-time. This data is transmitted to a Firebase Realtime Database, allowing users to track the waste level through a mobile application. Additionally, users can request waste pickup through the app.

## Technologies Used
- TensorFlow/Keras for object detection and classification.
- OpenCV for image processing.
- Firebase Realtime Database for storing and retrieving data.
- Arduino for interfacing with sensors and controlling LED indicators.
- Python for running the main processing script.

## Repository Structure
- **`dustbin_model/`:** Contains the TensorFlow/Keras model for object detection and classification.
- **`arduino_code/`:** Arduino sketch for interfacing with the ultrasonic sensor and controlling LED indicators.
- **`flutter_apps/`:** Flutter projects for the user-facing mobile applications.
- **`README.md`:** You are here! This document provides an overview of the project and instructions for setup.

## Setup Instructions
1. **Computer Setup:**
   - Install necessary Python packages: `numpy`, `opencv-python`, `tensorflow`, `firebase-admin`, `pyttsx3`.
   - Ensure the computer is connected to the internet for Firebase integration.
   - Run the main Python script to start the object detection process.

2. **Arduino Setup:**
   - Upload the `arduino_code/arduino_code.ino` sketch to the Arduino board.
   - Connect the ultrasonic sensor and LED indicators as per the wiring diagram.

3. **Firebase Configuration:**
   - Create a Firebase project and set up a Realtime Database.
   - Generate a service account key and download the JSON file. Place it in the appropriate directory.
   - Update the Firebase database URL in the Python script accordingly.

4. **Flutter App Setup:**
   - Navigate to the `flutter_apps/` directory and open each Flutter project in an IDE.
   - Modify the Firebase configuration to match your project's settings.
   - Build and deploy the apps to your Android/iOS devices.


## Circuit Diagram

![App Screenshot](https://github.com/anand-106/Waste-Segregation-Using-Arduino-and-TensorFlow/blob/3f131ddb1252f999a575473cfc39655c53474da3/dustbin_circuit.png)


## Usage
- **Object Detection:** The computer continuously processes live video from the camera. Detected objects are classified as biodegradable or non-biodegradable, and the results are displayed in real-time.
- **Waste Level Monitoring:** The ultrasonic sensor inside the dustbin measures the fill level, which is updated in the Firebase Realtime Database. Users can track the waste level through the mobile application.
- **Waste Pickup Requests:** Users can submit waste pickup requests through the mobile app. These requests are stored in the database and can be viewed by waste collection teams.


## Acknowledgments
- Mention any libraries, resources, or tutorials used.
- Acknowledge any collaborators or contributors who helped with the project.

