// Generated by gencpp from file imu_reader/imu_msgs.msg
// DO NOT EDIT!


#ifndef IMU_READER_MESSAGE_IMU_MSGS_H
#define IMU_READER_MESSAGE_IMU_MSGS_H


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
struct imu_msgs_
{
  typedef imu_msgs_<ContainerAllocator> Type;

  imu_msgs_()
    : acc_x(0.0)
    , acc_y(0.0)
    , ang_roll(0.0)
    , ang_pitch(0.0)
    , ang_yaw(0.0)  {
    }
  imu_msgs_(const ContainerAllocator& _alloc)
    : acc_x(0.0)
    , acc_y(0.0)
    , ang_roll(0.0)
    , ang_pitch(0.0)
    , ang_yaw(0.0)  {
  (void)_alloc;
    }



   typedef float _acc_x_type;
  _acc_x_type acc_x;

   typedef float _acc_y_type;
  _acc_y_type acc_y;

   typedef float _ang_roll_type;
  _ang_roll_type ang_roll;

   typedef float _ang_pitch_type;
  _ang_pitch_type ang_pitch;

   typedef float _ang_yaw_type;
  _ang_yaw_type ang_yaw;




  typedef boost::shared_ptr< ::imu_reader::imu_msgs_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::imu_reader::imu_msgs_<ContainerAllocator> const> ConstPtr;

}; // struct imu_msgs_

typedef ::imu_reader::imu_msgs_<std::allocator<void> > imu_msgs;

typedef boost::shared_ptr< ::imu_reader::imu_msgs > imu_msgsPtr;
typedef boost::shared_ptr< ::imu_reader::imu_msgs const> imu_msgsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::imu_reader::imu_msgs_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::imu_reader::imu_msgs_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::imu_reader::imu_msgs_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::imu_reader::imu_msgs_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::imu_msgs_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::imu_msgs_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::imu_msgs_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::imu_msgs_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::imu_reader::imu_msgs_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cd2c1f924dbee441b71bff2bd002151e";
  }

  static const char* value(const ::imu_reader::imu_msgs_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcd2c1f924dbee441ULL;
  static const uint64_t static_value2 = 0xb71bff2bd002151eULL;
};

template<class ContainerAllocator>
struct DataType< ::imu_reader::imu_msgs_<ContainerAllocator> >
{
  static const char* value()
  {
    return "imu_reader/imu_msgs";
  }

  static const char* value(const ::imu_reader::imu_msgs_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::imu_reader::imu_msgs_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message structure for IMU reading\n\
\n\
float32  acc_x\n\
float32	 acc_y\n\
float32	 ang_roll\n\
float32	 ang_pitch\n\
float32  ang_yaw\n\
";
  }

  static const char* value(const ::imu_reader::imu_msgs_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::imu_reader::imu_msgs_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.acc_x);
      stream.next(m.acc_y);
      stream.next(m.ang_roll);
      stream.next(m.ang_pitch);
      stream.next(m.ang_yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct imu_msgs_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::imu_reader::imu_msgs_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::imu_reader::imu_msgs_<ContainerAllocator>& v)
  {
    s << indent << "acc_x: ";
    Printer<float>::stream(s, indent + "  ", v.acc_x);
    s << indent << "acc_y: ";
    Printer<float>::stream(s, indent + "  ", v.acc_y);
    s << indent << "ang_roll: ";
    Printer<float>::stream(s, indent + "  ", v.ang_roll);
    s << indent << "ang_pitch: ";
    Printer<float>::stream(s, indent + "  ", v.ang_pitch);
    s << indent << "ang_yaw: ";
    Printer<float>::stream(s, indent + "  ", v.ang_yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMU_READER_MESSAGE_IMU_MSGS_H
