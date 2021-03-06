# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from farm_bot_driver/wheel_velocity_message.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class wheel_velocity_message(genpy.Message):
  _md5sum = "329705fbf5edc3538e8d30fb491f55ed"
  _type = "farm_bot_driver/wheel_velocity_message"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# Message structure for wheel angular velocities for Dynamixel series AX
# FR - Front right / FL - Front left / BR - Back right / BL - Back left
# Each wheel can only have positive angular velocities

uint32 FR_vel
uint32 FL_vel
uint32 BR_vel
uint32 BL_vel

"""
  __slots__ = ['FR_vel','FL_vel','BR_vel','BL_vel']
  _slot_types = ['uint32','uint32','uint32','uint32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       FR_vel,FL_vel,BR_vel,BL_vel

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(wheel_velocity_message, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.FR_vel is None:
        self.FR_vel = 0
      if self.FL_vel is None:
        self.FL_vel = 0
      if self.BR_vel is None:
        self.BR_vel = 0
      if self.BL_vel is None:
        self.BL_vel = 0
    else:
      self.FR_vel = 0
      self.FL_vel = 0
      self.BR_vel = 0
      self.BL_vel = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_4I.pack(_x.FR_vel, _x.FL_vel, _x.BR_vel, _x.BL_vel))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.FR_vel, _x.FL_vel, _x.BR_vel, _x.BL_vel,) = _struct_4I.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_4I.pack(_x.FR_vel, _x.FL_vel, _x.BR_vel, _x.BL_vel))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.FR_vel, _x.FL_vel, _x.BR_vel, _x.BL_vel,) = _struct_4I.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_4I = struct.Struct("<4I")
