function [x2 y2 b2] = XYfromGPS(lat1, long1, lat2, long2)
% converts GPS coordinates into cartesian coordinate system 
% such that XY plane is tangent to P1 and Y points to the NORTH and
% X points to the EAST and assuming P1 is at the origin (x1,y1)=(0,0)
% North
%   ^
%   |
%   Y
%   |
%  0,0---X--->East
% inputs lat1, long1, lat2, long2
% output x2 y2 b2-heading
  R=6.371*10^6; %earth radius
  lat1_=lat1*pi/180; %convert degrees into radians
  lat2_=lat2*pi/180;
  long1_=long1*pi/180;
  long2_=long2*pi/180;

  y2 = R*(lat2_-lat1_);
  x2 = R*(long2_-long1_).*cos(lat1_);
  b2 = atan2(x2,y2)*180/pi;
  %b2 = atan2(x2,y2)*180/pi;
end