// Generated by gencpp from file imu_reader/pid_control_reqResponse.msg
// DO NOT EDIT!


#ifndef IMU_READER_MESSAGE_PID_CONTROL_REQRESPONSE_H
#define IMU_READER_MESSAGE_PID_CONTROL_REQRESPONSE_H


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
struct pid_control_reqResponse_
{
  typedef pid_control_reqResponse_<ContainerAllocator> Type;

  pid_control_reqResponse_()
    : FL_vel(0)
    , FR_vel(0)
    , BL_vel(0)
    , BR_vel(0)  {
    }
  pid_control_reqResponse_(const ContainerAllocator& _alloc)
    : FL_vel(0)
    , FR_vel(0)
    , BL_vel(0)
    , BR_vel(0)  {
  (void)_alloc;
    }



   typedef int32_t _FL_vel_type;
  _FL_vel_type FL_vel;

   typedef int32_t _FR_vel_type;
  _FR_vel_type FR_vel;

   typedef int32_t _BL_vel_type;
  _BL_vel_type BL_vel;

   typedef int32_t _BR_vel_type;
  _BR_vel_type BR_vel;




  typedef boost::shared_ptr< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> const> ConstPtr;

}; // struct pid_control_reqResponse_

typedef ::imu_reader::pid_control_reqResponse_<std::allocator<void> > pid_control_reqResponse;

typedef boost::shared_ptr< ::imu_reader::pid_control_reqResponse > pid_control_reqResponsePtr;
typedef boost::shared_ptr< ::imu_reader::pid_control_reqResponse const> pid_control_reqResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::imu_reader::pid_control_reqResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dde3e382a89976fd53f866e2e38dcdca";
  }

  static const char* value(const ::imu_reader::pid_control_reqResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdde3e382a89976fdULL;
  static const uint64_t static_value2 = 0x53f866e2e38dcdcaULL;
};

template<class ContainerAllocator>
struct DataType< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "imu_reader/pid_control_reqResponse";
  }

  static const char* value(const ::imu_reader::pid_control_reqResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
int32  FL_vel\n\
int32  FR_vel\n\
int32  BL_vel\n\
int32  BR_vel\n\
";
  }

  static const char* value(const ::imu_reader::pid_control_reqResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.FL_vel);
      stream.next(m.FR_vel);
      stream.next(m.BL_vel);
      stream.next(m.BR_vel);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct pid_control_reqResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::imu_reader::pid_control_reqResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::imu_reader::pid_control_reqResponse_<ContainerAllocator>& v)
  {
    s << indent << "FL_vel: ";
    Printer<int32_t>::stream(s, indent + "  ", v.FL_vel);
    s << indent << "FR_vel: ";
    Printer<int32_t>::stream(s, indent + "  ", v.FR_vel);
    s << indent << "BL_vel: ";
    Printer<int32_t>::stream(s, indent + "  ", v.BL_vel);
    s << indent << "BR_vel: ";
    Printer<int32_t>::stream(s, indent + "  ", v.BR_vel);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMU_READER_MESSAGE_PID_CONTROL_REQRESPONSE_H
