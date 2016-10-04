/* This script tests the movement of the wheels as well as the variance for the accelerometer readings
   Observations: When the vehicle is stationary, the product of variance in x / y data is around 0.00 - 0.05
                 When the vehicle is moving, the product of variance is around 127 - 249 and above
*/

#include <SPI.h>
#include "ServoCds55.h"
#include <Servo.h>

int servoFL = 1;
int servoFR = 2;
int servoBL = 3;
int servoBR = 4;

const int FL_vel  = 100;
const int BL_vel  = 100;
const int FR_vel  = 100;
const int BR_vel  = 100;
const int xPin    = 32;
const int yPin    = 34;

ServoCds55 servomotor;

float getVariance(const float* array, int len){
  float avg   = 0;
  float var   = 0;
  
  for(int i=0; i<len; i++){
    avg       += array[i];
    }
  avg         = avg/((float) len);

  for(int i=0; i<len; i++){
    var       += pow((array[i] -avg),2);
    }
  var         = var/((float) len);
  return var;
  }

void checkAccelVarianceAndPublish(){
  const int scale         = 100;
  const int smpl_size     = 10;     // Sample size
  const float tolerance   = 10;     // Set tolerance for vibration
  float accel_x[smpl_size];
  float accel_y[smpl_size];
  float var_x;
  float var_y;
  
  for(int i=0; i<smpl_size; i++){
    accel_x[i]   = pulseIn(xPin,HIGH);
    accel_y[i]   = pulseIn(yPin,HIGH); 
    }
  
  var_x       = getVariance(accel_x, smpl_size) / (float) scale;      // Scales readings down to feasible values
  var_y       = getVariance(accel_y, smpl_size) / (float) scale;
//  Serial.print("var_x: ");
//  Serial.print(var_x);
//  Serial.print("var_y: ");
//  Serial.println(var_y);
    Serial.println(var_y *var_x);
  }

void checkIfVehicleStuck(){
  Serial.println("veh stuck");
  checkAccelVarianceAndPublish();
  }


void runServo(int servonum, int vel){
  servomotor.rotate(servonum,vel);
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(57600);
  servomotor.begin();
}

void startServo(){
  runServo(servoFL, FL_vel);
  runServo(servoFR, -FR_vel);
  runServo(servoBL, BL_vel);
  runServo(servoBR, -BR_vel);
  }

void loop() {
  // put your main code here, to run repeatedly:
  startServo();
  checkIfVehicleStuck();
}
