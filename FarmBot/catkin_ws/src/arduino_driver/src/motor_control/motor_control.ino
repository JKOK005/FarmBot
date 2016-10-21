#include <ros.h>
#include <SPI.h>
#include <farm_bot_driver/wheel_velocity_msg.h>
#include <arduino_driver/encoder_vel_msg.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Empty.h>
#include "ServoCDs55.h"
#include <Servo.h>

/******************* Global variabls *******************/
//servo number setup
int servoFL = 1;
int servoFR = 2;
int servoBL = 3;
int servoBR = 4;
int servoRotate = 5;
int servoDrill = 6;
int servoSeedPin = 9;
int servoWaterPin = 10;
ServoCds55 servomotor;
Servo servoSeed;
Servo servoWater;

bool goal_state   = false;      // Move to distance
int FL_vel;
int FR_vel;
int BL_vel;
int BR_vel;
int Drill_vel;
int Rotate_vel=25;

bool drill_state  = false;
bool plant_seed   = false; 
bool water_seed   = false;

const int xPin    = 32;
const int yPin    = 34;

const float timestep = 0.01;   // Timestep should match main script in RPi

/******************* Function prototyopes  *******************/
void checkIfVehicleStuck(void);
void set_wheel_vel_callback(const farm_bot_driver::wheel_velocity_msg &);
void set_goal_state_callback(const std_msgs::Bool &);
void set_drill_state_callback(const std_msgs::Bool &);
void set_plant_seed_callback(const std_msgs::Bool &);
void set_water_seed_callback(const std_msgs::Bool &);

void checkAccelVarianceAndPublish(int);
float getVariance(const float*, int);
void publishVehicleStuck(float, int);

/******************* ROS configuration  *******************/
ros::NodeHandle                     nh;

std_msgs::Empty                     empty_msg;
std_msgs::Bool                      boolean_msg;
arduino_driver::encoder_vel_msg     Enc_msg;

ros::Publisher encoder_vel_publisher("encoder_vel", &Enc_msg);
ros::Publisher arduino_opt_publisher("arduino_in_operation", &empty_msg);
ros::Publisher vehicle_is_stuck("veh_stuck", &boolean_msg);

ros::Subscriber<farm_bot_driver::wheel_velocity_msg> wheel_vel_subscriber("wheel_vel", &set_wheel_vel_callback);
ros::Subscriber<std_msgs::Bool> goal_state_subscriber("goal_state", &set_goal_state_callback);
ros::Subscriber<std_msgs::Bool> drill_state_subscriber("drill_state", &set_drill_state_callback);
ros::Subscriber<std_msgs::Bool> plant_seed_subscriber("plant_seed", &set_plant_seed_callback);
ros::Subscriber<std_msgs::Bool> water_seed_subscriber("water_seed", &set_water_seed_callback);

/******************* Main  *******************/
void publishVehicleStuck(float varianceProduct, int timeOut){
  nh.spinOnce();
  const unsigned int tolerance = 3;
  if(varianceProduct < tolerance || timeOut <= 0){
    // Publish stuck
    boolean_msg.data    = true;
    vehicle_is_stuck.publish(&boolean_msg);
    return;
    }
  else if(varianceProduct < tolerance && timeOut > 0){
    checkAccelVarianceAndPublish(--timeOut);
    }
  else{
    // Publish vehicle is fine
    boolean_msg.data    = false;
    vehicle_is_stuck.publish(&boolean_msg);
    }
  }

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

//  nh.loginfo("Arduino -> Calculated variance");
  return var;
  }

void checkAccelVarianceAndPublish(int timeOut){
  const int scale         = 100;
  const int smpl_size     = 10;     // Sample size
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
  
  // Serial.println(var_y *var_x);
  publishVehicleStuck(var_y *var_x, timeOut);
  }

void runServo(int servonum, int vel){
  servomotor.rotate(servonum,vel);
}

void moveServo(int servonum, int pos, int vel){
  servomotor.setVelocity(vel);  
  servomotor.write(servonum, pos);
  delay(3000);
}

void set_wheel_vel_callback(const farm_bot_driver::wheel_velocity_msg &vel_msg){
  // Function takes data and controls all 4 wheels angular velocity
  // data has the fields (int)FL_vel / FR_vel / BL_vel / BR_vel
  
  FL_vel  = vel_msg.FL_vel;   // Get the respective wheel velocities
  FR_vel  = vel_msg.FR_vel;
  BL_vel  = vel_msg.BL_vel;
  BR_vel  = vel_msg.BR_vel;
  }


void set_goal_state_callback(const std_msgs::Bool &status_msg){
  nh.loginfo("Goal -> Callback");
  goal_state    = status_msg.data;
  }

void set_drill_state_callback(const std_msgs::Bool &status_msg){
  drill_state    = status_msg.data;
  }

void set_plant_seed_callback(const std_msgs::Bool &status_msg){
  plant_seed    = status_msg.data;
  }

void set_water_seed_callback(const std_msgs::Bool &status_msg){
  water_seed    = status_msg.data;
  }

void setup(){
  nh.initNode();  
  
  nh.advertise(encoder_vel_publisher);      
  nh.advertise(arduino_opt_publisher);
  nh.advertise(vehicle_is_stuck);
  
  nh.subscribe(wheel_vel_subscriber);      
  nh.subscribe(goal_state_subscriber);
  nh.subscribe(drill_state_subscriber);
  nh.subscribe(plant_seed_subscriber);
  nh.subscribe(water_seed_subscriber);

  servoSeed.attach(servoSeedPin);
  servoWater.attach(servoWaterPin);

  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  
  Serial.begin(57600);
  servomotor.begin();
  delay(100);
  }


void loop(){
  if(goal_state){
    // Executes movement here
    // Commands each dynamixel to move at given angular velocity
    //Velocity scale is from 0 (min) - 1024 (max)
    
    nh.loginfo("Arduino -> Moving motor");
    runServo(servoFL, FL_vel);
    runServo(servoFR, -FR_vel);
    runServo(servoBL, BL_vel);
    runServo(servoBR, -BR_vel);
    delay(50);
    checkAccelVarianceAndPublish(5);
    delay(50);
    }
    
  else if(drill_state){
    // Drill hole
    nh.loginfo("Arduino -> Drilling hole");
    Drill_vel = 300;
    runServo(servoDrill, Drill_vel);
    moveServo(servoRotate, 120, Rotate_vel);
    delay(5000);
    moveServo(servoRotate, 0, Rotate_vel);
    runServo(servoDrill, 0);
    delay(1000);
    // Set task complete flag
    arduino_opt_publisher.publish(&empty_msg);
    }
    
  else if(plant_seed){
    nh.loginfo("Arduino -> Planting seed");
    // Plant seed
    servoSeed.writeMicroseconds(910);
    delay(4000);
    servoSeed.writeMicroseconds(3500);
    delay(4000);
    servoSeed.writeMicroseconds(910);
    delay(100);
    arduino_opt_publisher.publish(&empty_msg);
    }

  else if(water_seed){
    nh.loginfo("Arduino -> Watering seed");
    // Water seed

    servoWater.write(0);
    delay(2000);
    servoWater.write(170);
    delay(2000);
    servoWater.write(0);
    delay(1000);
    arduino_opt_publisher.publish(&empty_msg);
    }
  else {
    // Do nothing
    nh.loginfo("Arduino -> Waiting for instruction");
    runServo(servoFL, 0);
    runServo(servoFR, 0);
    runServo(servoBL, 0);
    runServo(servoBR, 0);
    }
  delay(100);
  nh.spinOnce();
  }

/*
 float* get_vel_encoder(void){
  // Return sequence is (float) vel_FL / vel_FR / vel_BL / vel_BR
  float *vel_encoder   = (float *) calloc(4, sizeof(float));    // We have to allocate memory which will persist after the destruction of the function
  vel_encoder[0] = 1.11;
  vel_encoder[1] = 2.22;
  vel_encoder[2] = 3.33;
  vel_encoder[3] = 4.44;
 
  return vel_encoder;
  }
  
  //  float v_FL, v_FR, v_BL, v_BR;
  float* vel_enc   = get_vel_encoder();
  
  Enc_msg.v_FL    = vel_enc[0];       // Gets wheel velocities from e1ncoder to publish
  Enc_msg.v_FR    = vel_enc[1];
  Enc_msg.v_BL    = vel_enc[2];
  Enc_msg.v_BR    = vel_enc[3];

  free(vel_enc);        // Releases memory 
  
//  Serial.println(vel_enc[0]);
//  Serial.println(vel_enc[1]);
//  Serial.println(vel_enc[2]);
//  Serial.println(vel_enc[3]);
//  Serial.println("<<<>>>");

  encoder_vel_publisher.publish(& Enc_msg);
*/ 

