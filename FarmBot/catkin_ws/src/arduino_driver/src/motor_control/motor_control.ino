#include <ros.h>
#include <farm_bot_driver/wheel_velocity_msg.h>
#include <arduino_driver/encoder_vel_msg.h>

void set_wheel_vel_callback(const farm_bot_driver::wheel_velocity_msg &);
float* get_vel_encoder(void);

float timestep = 0.1;   // Timestep should match main script in RPi
ros::NodeHandle nh;

arduino_driver::encoder_vel_msg Enc_msg;
ros::Publisher node_publisher("encoder_vel", &Enc_msg);
ros::Subscriber<farm_bot_driver::wheel_velocity_msg> node_subscriber("wheel_vel", &set_wheel_vel_callback);

void set_wheel_vel_callback(const farm_bot_driver::wheel_velocity_msg &vel_msg){
  // Function takes data and controls all 4 wheels angular velocity
  // data has the fields (int)FL_vel / FR_vel / BL_vel / BR_vel
  // Calvin write your function here

  int FL_vel, FR_vel, BL_vel, BR_vel;
  
  FL_vel  = vel_msg.FL_vel;   // Get the respective wheel velocities
  FR_vel  = vel_msg.FR_vel;
  BL_vel  = vel_msg.BL_vel;
  BR_vel  = vel_msg.BR_vel;

  // Commands each dynamixel to move at given angular velocity
  
  }


float* get_vel_encoder(void){
  // Function gets the encoder readings of all 4 wheels and computes velocity per wheel
  // Returns a pointer to float array
  // *** Sequence is (float) vel_FL / vel_FR / vel_BL / vel_BR
  // Calvin write your function here

  
  }


void setup(){
  nh.initNode();  
  nh.advertise(node_publisher);       // Publishes to encoder_vel topic
  nh.subscribe(node_subscriber);      // Subscribes to wheel_vel topic
  }


void loop(){
  float* vel_enc   = get_vel_encoder();

  Enc_msg.v_FL    = *vel_enc;       // Gets wheel velocities from encoder to publish
  Enc_msg.v_FR    = *(vel_enc +1);
  Enc_msg.v_BL    = *(vel_enc +2);
  Enc_msg.v_BR    = *(vel_enc +3);

  node_publisher.publish(& Enc_msg);
  nh.spinOnce();
  delay(50);
  }

