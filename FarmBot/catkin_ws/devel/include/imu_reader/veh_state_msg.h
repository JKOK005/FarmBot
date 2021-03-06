// Generated by gencpp from file imu_reader/veh_state_msg.msg
// DO NOT EDIT!


#ifndef IMU_READER_MESSAGE_VEH_STATE_MSG_H
#define IMU_READER_MESSAGE_VEH_STATE_MSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace imu_reader
{
template <class ContainerAllocator>
struct veh_state_msg_
{
  typedef veh_state_msg_<ContainerAllocator> Type;

  veh_state_msg_()
    : vx(0.0)
    , vy(0.0)
    , th_roll(0.0)
    , th_pitch(0.0)
    , th_yaw(0.0)  {
    }
  veh_state_msg_(const ContainerAllocator& _alloc)
    : vx(0.0)
    , vy(0.0)
    , th_roll(0.0)
    , th_pitch(0.0)
    , th_yaw(0.0)  {
  (void)_alloc;
    }



   typedef float _vx_type;
  _vx_type vx;

   typedef float _vy_type;
  _vy_type vy;

   typedef float _th_roll_type;
  _th_roll_type th_roll;

   typedef float _th_pitch_type;
  _th_pitch_type th_pitch;

   typedef float _th_yaw_type;
  _th_yaw_type th_yaw;




  typedef boost::shared_ptr< ::imu_reader::veh_state_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::imu_reader::veh_state_msg_<ContainerAllocator> const> ConstPtr;

}; // struct veh_state_msg_

typedef ::imu_reader::veh_state_msg_<std::allocator<void> > veh_state_msg;

typedef boost::shared_ptr< ::imu_reader::veh_state_msg > veh_state_msgPtr;
typedef boost::shared_ptr< ::imu_reader::veh_state_msg const> veh_state_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::imu_reader::veh_state_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::imu_reader::veh_state_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace imu_reader

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'imu_reader': ['/home/jo/farm_bot_workspace/catkin_ws/src/imu_reader/msg'], 'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::imu_reader::veh_state_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::imu_reader::veh_state_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::veh_state_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::veh_state_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::veh_state_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::veh_state_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::imu_reader::veh_state_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "255b57f2bfaeefe2dc3f6cf83cc6204e";
  }

  static const char* value(const ::imu_reader::veh_state_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x255b57f2bfaeefe2ULL;
  static const uint64_t static_value2 = 0xdc3f6cf83cc6204eULL;
};

template<class ContainerAllocator>
struct DataType< ::imu_reader::veh_state_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "imu_reader/veh_state_msg";
  }

  static const char* value(const ::imu_reader::veh_state_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::imu_reader::veh_state_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message structure for vehicle state\n\
\n\
float32  vx\n\
float32	 vy\n\
float32	 th_roll\n\
float32	 th_pitch\n\
float32  th_yaw\n\
";
  }

  static const char* value(const ::imu_reader::veh_state_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::imu_reader::veh_state_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vx);
      stream.next(m.vy);
      stream.next(m.th_roll);
      stream.next(m.th_pitch);
      stream.next(m.th_yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct veh_state_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::imu_reader::veh_state_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::imu_reader::veh_state_msg_<ContainerAllocator>& v)
  {
    s << indent << "vx: ";
    Printer<float>::stream(s, indent + "  ", v.vx);
    s << indent << "vy: ";
    Printer<float>::stream(s, indent + "  ", v.vy);
    s << indent << "th_roll: ";
    Printer<float>::stream(s, indent + "  ", v.th_roll);
    s << indent << "th_pitch: ";
    Printer<float>::stream(s, indent + "  ", v.th_pitch);
    s << indent << "th_yaw: ";
    Printer<float>::stream(s, indent + "  ", v.th_yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMU_READER_MESSAGE_VEH_STATE_MSG_H
