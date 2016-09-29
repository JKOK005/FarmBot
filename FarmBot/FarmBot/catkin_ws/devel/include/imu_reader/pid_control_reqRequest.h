// Generated by gencpp from file imu_reader/pid_control_reqRequest.msg
// DO NOT EDIT!


#ifndef IMU_READER_MESSAGE_PID_CONTROL_REQREQUEST_H
#define IMU_READER_MESSAGE_PID_CONTROL_REQREQUEST_H


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
struct pid_control_reqRequest_
{
  typedef pid_control_reqRequest_<ContainerAllocator> Type;

  pid_control_reqRequest_()
    : yaw(0.0)  {
    }
  pid_control_reqRequest_(const ContainerAllocator& _alloc)
    : yaw(0.0)  {
  (void)_alloc;
    }



   typedef float _yaw_type;
  _yaw_type yaw;




  typedef boost::shared_ptr< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> const> ConstPtr;

}; // struct pid_control_reqRequest_

typedef ::imu_reader::pid_control_reqRequest_<std::allocator<void> > pid_control_reqRequest;

typedef boost::shared_ptr< ::imu_reader::pid_control_reqRequest > pid_control_reqRequestPtr;
typedef boost::shared_ptr< ::imu_reader::pid_control_reqRequest const> pid_control_reqRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::imu_reader::pid_control_reqRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2160bf7632f25ad6dc7c5aab561198d4";
  }

  static const char* value(const ::imu_reader::pid_control_reqRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2160bf7632f25ad6ULL;
  static const uint64_t static_value2 = 0xdc7c5aab561198d4ULL;
};

template<class ContainerAllocator>
struct DataType< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "imu_reader/pid_control_reqRequest";
  }

  static const char* value(const ::imu_reader::pid_control_reqRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
\n\
float32 yaw\n\
";
  }

  static const char* value(const ::imu_reader::pid_control_reqRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct pid_control_reqRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::imu_reader::pid_control_reqRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::imu_reader::pid_control_reqRequest_<ContainerAllocator>& v)
  {
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMU_READER_MESSAGE_PID_CONTROL_REQREQUEST_H
